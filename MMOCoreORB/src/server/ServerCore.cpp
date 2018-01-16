/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#include "ServerCore.h"

#include "db/ServerDatabase.h"

#include "db/MantisDatabase.h"

#include "server/chat/ChatManager.h"

#include "server/login/LoginServer.h"

#include "features/Features.h"

#include "ping/PingServer.h"

#include "status/StatusServer.h"

#include "web/WebServer.h"

#include "server/zone/ZoneServer.h"

#include "server/zone/managers/object/ObjectManager.h"
#include "server/zone/managers/templates/TemplateManager.h"
#include "server/zone/managers/player/PlayerManager.h"

#include "server/zone/objects/creature/CreatureObject.h"

#include <ctime>

//SWG Awakening Custom -- Includes
#include "server/settings/ServerSettings.h"

ManagedReference<ZoneServer*> ServerCore::zoneServerRef = NULL;
SortedVector<String> ServerCore::arguments;
bool ServerCore::truncateAllData = false;
ServerCore* ServerCore::instance = NULL;

ServerCore::ServerCore(bool truncateDatabases, SortedVector<String>& args) :
		Core("log/core3.log"), Logger("Core") {
	orb = NULL;

	loginServer = NULL;
	zoneServerRef = NULL;
	statusServer = NULL;
	pingServer = NULL;
	webServer = NULL;
	database = NULL;
	mantisDatabase = NULL;

	truncateAllData = truncateDatabases;
	arguments = args;

	instance = this;

	configManager = ConfigManager::instance();

	//SWG Awakening Custom -- Server Settings
	serversettings = ServerSettings::instance();

	features = NULL;
}

class ZoneStatisticsTask: public Task {
	ManagedReference<ZoneServer*> zoneServer;

public:
	ZoneStatisticsTask(ZoneServer* server) {
		zoneServer = server;
	}

	void run() {
		zoneServer->printInfo();
	}
};

void ServerCore::signalShutdown() {
	shutdownBlockMutex.lock();

	waitCondition.broadcast(&shutdownBlockMutex);

	shutdownBlockMutex.unlock();
}

//SWG Awakening Custom -- Daily Timed Shutdown Thread
//Configurable Variables Defined In Server Settings Config
void *worker_1(void *) {
	Thread::sleep(300000);
	ZoneServer* zoneServer = ServerCore::getZoneServer();
	ChatManager* chatManager = zoneServer->getChatManager();
	int hour = ServerSettings::instance()->getHour();
	int minute = ServerSettings::instance()->getMinute();

	while (true) {
		Thread::sleep(60000);
		time_t currentTime;
		struct tm *localTime;
		time (&currentTime);
		localTime = localtime (&currentTime);

		if (localTime->tm_hour == hour && localTime->tm_min >= minute && localTime->tm_min < minute + 5) {
			std::cout << "Daily server restart has started" << std::endl;
			chatManager->broadcastGalaxy(NULL, "The server will be restarting in 15 minutes.");
			Thread::sleep(300000);
			chatManager->broadcastGalaxy(NULL, "The server will be restarting in 10 minutes.");
			Thread::sleep(300000);
			chatManager->broadcastGalaxy(NULL, "The server will be restarting in 5 minutes.");
			Thread::sleep(210000);
			ObjectManager::instance()->createBackup();
			Thread::sleep(90000);
			chatManager->broadcastGalaxy(NULL, "The server is restarting now!");
			Thread::sleep(2000);
			exit(0);
		}
	}
}

//SWG Awakening Custom -- Create Daily Timed Shutdown Thread On Server Start
int Workers() {
	if (ServerSettings::instance()->getAutoShutdownEnabled()) {
		pthread_t rw1;
		pthread_create(&rw1, NULL, worker_1, NULL);
	}
    return 0;
}

void ServerCore::initialize() {
	info("starting up server..");
	processConfig();
	Workers();

	try {
		ObjectManager* objectManager = ObjectManager::instance();

		database = new ServerDatabase(configManager);

		mantisDatabase = new MantisDatabase(configManager);

		String& orbaddr = configManager->getORBNamingDirectoryAddress();
		orb = DistributedObjectBroker::initialize(orbaddr,
//				DistributedObjectBroker::NAMING_DIRECTORY_PORT);
				44419);

		orb->setCustomObjectManager(objectManager);

		if (configManager->getMakeLogin()) {
			loginServer = new LoginServer(configManager);
			loginServer->deploy("LoginServer");
		}

		if (configManager->getMakeZone()) {
			ZoneServer* zoneServer = new ZoneServer(configManager);
			zoneServer->deploy("ZoneServer");

			zoneServerRef = zoneServer;
		}

		if (configManager->getMakePing()) {
			pingServer = new PingServer();
		}

		if (configManager->getMakeStatus()) {
			statusServer = new StatusServer(configManager, zoneServerRef);
		}

		if (configManager->getMakeWeb()) {
			webServer = WebServer::instance();
		}

		ZoneServer* zoneServer = zoneServerRef.get();

		if (zoneServer != NULL) {
			int zonePort = 44463;
			int zoneAllowedConnections =
					configManager->getZoneAllowedConnections();

			ObjectDatabaseManager* dbManager =
					ObjectDatabaseManager::instance();
			dbManager->loadDatabases(truncateDatabases());

			int galaxyID = configManager->getZoneGalaxyID();

			try {
				String query = "SELECT port FROM galaxy WHERE galaxy_id = "
						+ String::valueOf(galaxyID);
				Reference<ResultSet*> result =
						database->instance()->executeQuery(query);

				if (result != NULL && result->next()) {
					zonePort = result->getInt(0);
				}

				database->instance()->executeStatement(
						"TRUNCATE TABLE sessions");

				database->instance()->executeStatement(
						"DELETE FROM characters_dirty WHERE galaxy_id = "
								+ String::valueOf(galaxyID));
			} catch (DatabaseException& e) {
				error(e.getMessage());

				exit(1);
			}

			zoneServer->start(zonePort, zoneAllowedConnections);
		}

		if (statusServer != NULL) {
			int statusPort = configManager->getStatusPort();
			int statusAllowedConnections =
					configManager->getStatusAllowedConnections();

			statusServer->start(statusPort);
		}

		if (webServer != NULL) {
			webServer->start(configManager);
		}

		if (pingServer != NULL) {
			int pingPort = configManager->getPingPort();
			int pingAllowedConnections =
					configManager->getPingAllowedConnections();

			pingServer->start(pingPort, pingAllowedConnections);
		}

		if (loginServer != NULL) {
			int loginPort = configManager->getLoginPort();
			int loginAllowedConnections =
					configManager->getLoginAllowedConnections();

			loginServer->start(loginPort, loginAllowedConnections);
		}

		bool popDisplayEnabled = ServerSettings::instance()->getPopDisplayEnabled();
		bool loadDisplayEnabled = ServerSettings::instance()->getLoadDisplayEnabled();

#ifndef WITH_STM
		ObjectManager::instance()->scheduleUpdateToDatabase();
#else
		Task* statiscticsTask = new ZoneStatisticsTask(zoneServerRef);
		statiscticsTask->schedulePeriodic(10000, 10000);
#endif

		info("initialized", true);
		
		if(arguments.contains("playercleanup") && zoneServer != NULL){
			zoneServer->getPlayerManager()->cleanupCharacters();
		}

		if(arguments.contains("playercleanupstats") && zoneServer != NULL){
			zoneServer->getPlayerManager()->getCleanupCharacterCount();
		}
		
	} catch (ServiceException& e) {
		shutdown();
	} catch (DatabaseException& e) {
		info(e.getMessage());

		exit(1);
	}
}

void ServerCore::run() {
	handleCommands();

	shutdown();
}

void ServerCore::shutdown() {
	info("shutting down server..");

	ObjectManager::instance()->cancelUpdateModifiedObjectsTask();
	ObjectDatabaseManager::instance()->checkpoint();

	info("database checkpoint done", true);

	if (statusServer != NULL) {
		statusServer->stop();

		//delete statusServer;
		statusServer = NULL;
	}

	if (webServer != NULL) {
		webServer->stop();

		webServer = NULL;
	}

	ZoneServer* zoneServer = zoneServerRef.get();

	if (zoneServer != NULL) {
		zoneServer->stop();
		//zoneServer->finalize();

		zoneServer = NULL;
	}

	if (loginServer != NULL) {
		loginServer->stop();

		//loginServer = NULL;
	}

	if (pingServer != NULL) {
		pingServer->stop();

		//delete pingServer;
		pingServer = NULL;
	}

	if (features != NULL) {
		delete features;
		features = NULL;
	}

	if (database != NULL) {
		delete database;
		database = NULL;
	}

	if (mantisDatabase != NULL) {
		delete mantisDatabase;
		mantisDatabase = NULL;
	}

	//zoneServerRef = NULL;

	info("server closed");

	//exit(1);
}

void ServerCore::handleCommands() {
	while (true) {

#ifdef WITH_STM
		Reference<Transaction*> transaction = TransactionalMemoryManager::instance()->startTransaction();
#endif

		try {
			String fullCommand;

			Thread::sleep(500);

			System::out << "> ";

			char line[256];
			fgets(line, sizeof(line), stdin);

			fullCommand = line;
			fullCommand = fullCommand.replaceFirst("\n", "");

			StringTokenizer tokenizer(fullCommand);

			String command, arguments;

			if (tokenizer.hasMoreTokens())
				tokenizer.getStringToken(command);

			if (tokenizer.hasMoreTokens())
				tokenizer.finalToken(arguments);

			ZoneServer* zoneServer = zoneServerRef.getForUpdate();

			if (command == "exit") {
				if (zoneServer != NULL) {
					ChatManager* chatManager = zoneServer->getChatManager();
					chatManager->broadcastGalaxy(NULL,
							"Server is shutting down NOW!");
				}

				return;
			} else if (command == "dumpmem") {
#ifdef DEBUG_MEMORY
				DumpUnfreed(TRUE);
#endif
			} else if (command == "logQuadTree") {
				QuadTree::setLogging(!QuadTree::doLog());
			} else if (command == "info") {
				//TaskManager::instance()->printInfo();

				if (loginServer != NULL)
					loginServer->printInfo();

				if (zoneServer != NULL)
					zoneServer->printInfo();

				if (pingServer != NULL)
					pingServer->printInfo();
			} else if (command == "lock") {
				if (zoneServer != NULL)
					zoneServer->setServerStateLocked();
			} else if (command == "unlock") {
				if (zoneServer != NULL)
					zoneServer->setServerStateOnline();
			} else if (command == "icap") {
				if (zoneServer != NULL)
					zoneServer->changeUserCap(50);
			} else if (command == "dcap") {
				if (zoneServer != NULL)
					zoneServer->changeUserCap(-50);
			} else if (command == "fixQueue") {
				if (zoneServer != NULL)
					zoneServer->fixScheduler();
			} else if (command == "save") {
				ObjectManager::instance()->createBackup();
				//ObjectDatabaseManager::instance()->checkpoint();
			} else if (command == "help") {
				System::out << "available commands:\n";
				System::out
						<< "\texit, logQuadTree, info, icap, dcap, fixQueue, crash.\n";
			} else if (command == "chars") {
				uint32 num = 0;

				try {
					num = UnsignedInteger::valueOf(arguments);
				} catch (Exception& e) {
					System::out << "invalid number of concurrent chars per account specified";
				}

				if (num != 0) {
					PlayerManagerImplementation::MAX_CHAR_ONLINE_COUNT = num;

					System::out << "changed max concurrent chars per account to: " << num << endl;
				}
			} else if (command == "lookupcrc") {
				uint32 crc = 0;
				try {
					crc = UnsignedInteger::valueOf(arguments);
				} catch (Exception& e) {
					System::out << "invalid crc number expected dec";
				}

				if (crc != 0) {
					String file = TemplateManager::instance()->getTemplateFile(
							crc);

					System::out << "result: " << file << endl;
				}

			} else if (command == "rev") {
				System::out << ConfigManager::instance()->getRevision() << endl;
			} else if (command == "broadcast") {
				ChatManager* chatManager = zoneServer->getChatManager();
				chatManager->broadcastGalaxy(NULL, arguments);
			} else if (command == "shutdown") {
				int minutes = 1;

				try {
					minutes = UnsignedInteger::valueOf(arguments);
				} catch (Exception& e) {
					System::out << "invalid minutes number expected dec";
				}

				if (zoneServer != NULL) {
					zoneServer->timedShutdown(minutes);

					shutdownBlockMutex.lock();

					waitCondition.wait(&shutdownBlockMutex);

					shutdownBlockMutex.unlock();
				}

				return;
			} else if ( command == "playercleanup" ) {

				if(zoneServerRef != NULL){
					ZoneServer* server = zoneServerRef.get();

					if(server != NULL)
						server->getPlayerManager()->cleanupCharacters();
				}

			} else if ( command == "playercleanupstats" ) {

				if(zoneServerRef != NULL){

					ZoneServer* server = zoneServerRef.get();

					if(server != NULL)
						server->getPlayerManager()->getCleanupCharacterCount();
				}

			} else
				System::out << "unknown command (" << command << ")\n";
		} catch (SocketException& e) {
			System::out << "[ServerCore] " << e.getMessage();
		} catch (ArrayIndexOutOfBoundsException& e) {
			System::out << "[ServerCore] " << e.getMessage() << "\n";
		} catch (Exception& e) {
			System::out << "[ServerCore] unreported Exception caught\n";
		}

#ifdef WITH_STM
		try {
			TransactionalMemoryManager::commitPureTransaction(transaction);
		} catch (const TransactionAbortedException& e) {
		}
#endif

	}
}

void ServerCore::processConfig() {
	if (!configManager->loadConfigData())
		info("Missing config file, loading default values.");

	//SWG Awakening Custom -- Read Server Settings Config File On Server Start
	if (!serversettings->loadServerSettingsData())
		info("Public & Private server settings file missing, loading default values.");

	//if (!features->loadFeatures())
	//info("Problem occurred trying to load features.lua");
}
