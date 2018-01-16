/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "StatusServer.h"
#include "StatusHandler.h"

//SWG Awakening Custom -- Includes
#include "server/settings/ServerSettings.h"
//#include "../zone/managers/item/ItemManager.h"

StatusServer::StatusServer(ConfigManager* conf, ZoneServer* server)
		: StreamServiceThread("StatusServer") {
	zoneServer = server;
	configManager = conf;
	statusHandler = new StatusHandler(this);

	oid = 0;
	lastStatus = true;

	statusInterval = configManager->getStatusInterval();

	signal(SIGPIPE, SIG_IGN);
	
	setLogging(false);
}

StatusServer::~StatusServer() {
	//obj->finalize();
}

void StatusServer::init() {
	timestamp.updateToCurrentTime();
	lastStatus = true;

	setHandler(statusHandler);

	if (zoneServer != NULL) {
		//oid = zoneServer->getItemManager()->getNextStaticObjectID();
		//obj = new Attachment(oid, 0, "", "", 1);
	}

	info("initialized", true);
}

void StatusServer::run() {
	acceptConnections();

	shutdown();
}

void StatusServer::shutdown() {
}

ServiceClient* StatusServer::createConnection(Socket* sock, SocketAddress& addr) {
	Packet* pack = getStatusXMLPacket();

try {
	sock->send(pack);
} catch (...) {
}

	sock->close();
	delete sock;

	delete pack;

	Thread::sleep(100);

	return NULL;
}

Packet* StatusServer::getStatusXMLPacket() {
	Packet* pack = new Packet();

	timestamp.updateToCurrentTime();

	//SWG Awakening Custom -- Status Server, Option To Display Load Or Current Population
	//Configurable Variables Defined In Server Settings Config
	int connectedPlayers = zoneServer->getConnectionCount();
	int maxPlayers = zoneServer->getMaxPlayers();
	int totalPlayers = zoneServer->getTotalPlayers();
	StringBuffer ConnectedPlayers;
	StringBuffer MaxPlayers;
	StringBuffer TotalPlayers;

	if (ServerSettings::instance()->getPopDisplayEnabled()) {
		if (ServerSettings::instance()->getLoadDisplayEnabled()) {
			TotalPlayers << "Unavailable";
			MaxPlayers << "Unavailable";
			if (connectedPlayers >= zoneServer->getServerCap())
				ConnectedPlayers << "Full";
			else if (connectedPlayers >= ServerSettings::instance()->getVeryHeavyLoad())
				ConnectedPlayers << "Very Heavy";
			else if (connectedPlayers >= ServerSettings::instance()->getHeavyLoad())
				ConnectedPlayers << "Heavy";
			else if (connectedPlayers >= ServerSettings::instance()->getMediumLoad())
				ConnectedPlayers << "Medium";
			else
				ConnectedPlayers << "Light";
		} else {
			ConnectedPlayers << connectedPlayers;
			MaxPlayers << maxPlayers;
			TotalPlayers << totalPlayers;
		}
	} else {
		ConnectedPlayers << "Unavailable";
		TotalPlayers << "Unavailable";
		MaxPlayers << "Unavailable";
	}

	StringBuffer str;
	str << "<?xml version=\"1.0\" standalone=\"yes\"?>" << endl;
	str << "<zoneServer>" << endl;

	if ((lastStatus = testZone())) {
		str << "<name>" << zoneServer->getGalaxyName() << "</name>" << endl;
		str << "<status>up</status>" << endl;
		str << "<connected>" << ConnectedPlayers.toString() << "</connected>" << endl;
		str << "<cap>" << zoneServer->getServerCap() << "</cap>" << endl;
		str << "<max>" << MaxPlayers.toString() << "</max>" << endl;
		str << "<total>" << TotalPlayers.toString() << "</total>" << endl;
		str << "<deleted>" << zoneServer->getDeletedPlayers() << "</deleted>" << endl;
		str << "<uptime>" << zoneServer->getStartTimestamp()->miliDifference(timestamp) / 1000 << "</uptime>" << endl;
	} else {
		str << "<status>down</status>";
	}
	str << "<timestamp>" << timestamp.getMiliTime() << "</timestamp>" << endl;
	str << "</zoneServer>" << endl;

	String xml = str.toString();
	pack->insertStream(xml.toCharArray(), xml.length());

	return pack;
}

bool StatusServer::testZone() {
	if (zoneServer == NULL)
		return false;

	if (-timestamp.miliDifference() < statusInterval) {
		return lastStatus;
	}

	timestamp.updateToCurrentTime();

	/*try {
		zoneServer->transferObject(obj);

		return zoneServer->removeObject(oid) == obj;
	} catch (...) {
		return false;
	}*/

	return true;
}
