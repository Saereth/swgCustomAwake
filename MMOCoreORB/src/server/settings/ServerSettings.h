/*
 *	SWG Awakening Custom -- ServerSettings.h
 *	Copyright (C) <SWG Awakening>
 */

#ifndef SERVERSETTINGS_H_
#define SERVERSETTINGS_H_

#include "engine/engine.h"
#include "server/ServerCore.h"

extern bool useCustom;
namespace server {
	namespace conf {

	class ServerSettings : public Singleton<ServerSettings>, public Lua {

	//Login Error Message Config
	String revisionError;
	String registerError;
	String activateError;
	String passwordError;
	String bannedError;

	//Character Creation Config
	int charactersPerGalaxy;
	String charactersPerGalaxyError;
	int createTime;
	String createTimeError;
	String createSuiTitle;
	String createSuiMessage;

	//Status Server Population Display Config
	bool popDisplayEnabled;
	bool loadDisplayEnabled;
	int mediumLoad;
	int heavyLoad;
	int veryHeavyLoad;

	//Auto Shutdown Config
	bool autoShutdownEnabled;
	int hour;
	int minute;

	//Enhancement Terminal Config
	bool enhancementTerminalEnabled;
	int buffCost;
	int cleanseCost;
	int removeCost;
	int terminalPerformanceBuff;
	int terminalMedicalBuff;
	int terminalPerformaceDuration;
	int terminalMedicalDuration;

	//Character Builder Config
	bool characterBuilderEnabled;
	bool characterBuilderAdminOnly;
	int builderPerformanceBuff;
	int builderMedicalBuff;
	int builderPerformanceDuration;
	int builderMedicalDuration;

	//Jedi Unlock Config
	String column1;
	String column2;
	String column3;
	String column4;
	String column5;
	String column6;
	String column7;
	String column8;
	String column9;
	String column10;
	String column11;
	String column12;
	int rand1;
	int rand2;
	int rand3;
	int rand4;
	int rand5;
	int rand6;
	int rand7;
	int rand8;
	int rand9;

	//Jedi Experience Divisor Config
	float jediXpDivisor;

	//Shrine Jedi Progression Check Config
	bool shrineProgressionEnabled;

	//Galaxy Jedi Unlock Message Config
	bool unlockMessageEnabled;
	String unlockMessage;

	//Spawn Protection Config
	bool spawnProtectionEnabled;
	int spawnProtectionTime;

	//TEF System Config
	bool tefEnabled;
	bool cityTefEnabled;

	//City Alignment Config
	int cityAlignRankReq;

	//Faction Base Overt Scanner Config
	bool overtScannersEnabled;

	//Increased House Storage Config
	bool increasedStorageEnabled;
	int twoLots;
	int threeLots;
	int fourLots;
	int fiveLots;

	//Inactive Player Structure Cleanup
	bool enableInactiveStructureCleanup;
	int inactiveStructureCleanupTime;

	//Post 14.1 Furniture Rotation Config
	bool allRotationEnabled;

	//Event System Config
	bool eventSystemEnabled;
	bool awardBadgeEnabled;
	bool awardItemEnabled;
	int awardedBadge;
	String awardedItem1;
	String awardedItem2;

	public:
		ServerSettings();

		~ServerSettings() {
		}
		bool loadServerSettingsFile() {
			bool customSettings = runFile("custom_scripts/conf/server_settings.lua");

			if (customSettings) {
				useCustom = true;
				return true;
			} else {
				return runFile("conf/server_settings.lua");
			}
		}

		bool loadServerSettingsData();

		//Login Error Message Config Getter
		inline String getRevisionError() {
			return revisionError;
			}
		inline String getRegisterError() {
			return registerError;
			}
		inline String getActivateError() {
			return activateError;
			}
		inline String getPasswordError() {
			return passwordError;
			}
		inline String getBannedError() {
			return bannedError;
			}

		//Character Creation Config Getter
		inline int getCharactersPerGalaxy() {
			return charactersPerGalaxy;
			}
		inline String getCharactersPerGalaxyError() {
			return charactersPerGalaxyError;
			}
		inline int getCreateTime() {
			return createTime;
			}
		inline String getCreateTimeError() {
			return createTimeError;
			}
		inline String getCreateSuiTitle() {
			return createSuiTitle;
			}
		inline String getCreateSuiMessage() {
			return createSuiMessage;
			}

		//Status Server Population Display Config Getter
		inline bool getPopDisplayEnabled() {
			return popDisplayEnabled;
		}
		inline bool getLoadDisplayEnabled() {
			return loadDisplayEnabled;
		}
		inline int getMediumLoad() {
			return mediumLoad;
		}
		inline int getHeavyLoad() {
			return heavyLoad;
		}
		inline int getVeryHeavyLoad() {
			return veryHeavyLoad;
		}

		//Auto Shutdown Config Getter
		inline bool getAutoShutdownEnabled() {
			return autoShutdownEnabled;
		}
		inline int getHour() {
			return hour;
		}
		inline int getMinute() {
			return minute;
		}

		//Enhancement Terminal Config Getter
		inline bool getEnhancementTerminalEnabled() {
			return enhancementTerminalEnabled;
		}
		inline int getBuffCost() {
			return buffCost;
		}
		inline int getCleanseCost() {
			return cleanseCost;
		}
		inline int getRemoveCost() {
			return removeCost;
		}
		inline int getTerminalPerformanceBuff() {
			return terminalPerformanceBuff;
		}
		inline int getTerminalMedicalBuff() {
			return terminalMedicalBuff;
		}
		inline int getTerminalPerformanceDuration() {
			return terminalPerformaceDuration;
		}
		inline int getTerminalMedicalDuration() {
			return terminalMedicalDuration;
		}

		//Character Builder Config Getter
		inline bool getCharacterBuilderEnabled() {
			return characterBuilderEnabled;
		}
		inline bool getCharacterBuilderAdminOnly() {
			return characterBuilderAdminOnly;
		}
		inline int getBuilderPerformanceBuff() {
			return builderPerformanceBuff;
		}
		inline int getBuilderMedicalBuff() {
			return builderMedicalBuff;
		}
		inline int getBuilderPerformanceDuration() {
			return builderPerformanceDuration;
		}
		inline int getBuilderMedicalDuration() {
			return builderMedicalDuration;
		}

		//Jedi Unlock Config Getter
		inline String getColumn1() {
			return column1;
		}
		inline String getColumn2() {
			return column2;
		}
		inline String getColumn3() {
			return column3;
		}
		inline String getColumn4() {
			return column4;
		}
		inline String getColumn5() {
			return column5;
		}
		inline String getColumn6() {
			return column6;
		}
		inline String getColumn7() {
			return column7;
		}
		inline String getColumn8() {
			return column8;
		}
		inline String getColumn9() {
			return column9;
		}
		inline String getColumn10() {
			return column10;
		}
		inline String getColumn11() {
			return column11;
		}
		inline String getColumn12() {
			return column12;
		}
		inline int getRand1() {
			return rand1;
		}
		inline int getRand2() {
			return rand2;
		}
		inline int getRand3() {
			return rand3;
		}
		inline int getRand4() {
			return rand4;
		}
		inline int getRand5() {
			return rand5;
		}
		inline int getRand6() {
			return rand6;
		}
		inline int getRand7() {
			return rand7;
		}
		inline int getRand8() {
			return rand8;
		}
		inline int getRand9() {
			return rand9;
		}

		//Jedi Experience Divisor Config Getter
		inline float getJediXpDivisor() {
			return jediXpDivisor;
		}

		//Shrine Jedi Progression Check Config Getter
		inline bool getShrineProgressionEnabled() {
			return shrineProgressionEnabled;
		}

		//Galaxy Jedi Unlock Message Config Getter
		inline bool getUnlockMessageEnabled() {
			return unlockMessageEnabled;
		}
		inline String getUnlockMessage() {
			return unlockMessage;
		}

		//Spawn Protection Config Getter
		inline bool getSpawnProtectionEnabled() {
			return spawnProtectionEnabled;
		}
		inline int getSpawnProtectionTime() {
			return spawnProtectionTime;
		}

		//TEF System Config Getter
		inline bool getTefEnabled() {
			return tefEnabled;
		}
		inline bool getCityTefEnabled() {
			return cityTefEnabled;
		}

		//City Alignment Config Getter
		inline int getCityAlignRankReq() {
			return cityAlignRankReq;
		}

		//Faction Base Overt Scanner Config Getter
		inline bool getOvertScannersEnabled() {
			return overtScannersEnabled;
		}

		//Increased House Storage Config Getter
		inline bool getIncreasedStorageEnabled() {
			return increasedStorageEnabled;
		}
		inline int getTwoLots() {
			return twoLots;
		}
		inline int getThreeLots() {
			return threeLots;
		}
		inline int getFourLots() {
			return fourLots;
		}
		inline int getFiveLots() {
			return fiveLots;
		}

		//Inactive Player Structure Cleanup
		inline bool getEnableInactiveStructureCleanup() {
			return enableInactiveStructureCleanup;
		}
		inline int getInactiveStructureCleanupTime() {
			return inactiveStructureCleanupTime;
		}

		//Post 14.1 Furniture Rotation Config Getter
		inline bool getAllRotationEnabled() {
			return allRotationEnabled;
		}

		//Event System Config Getter
		inline bool getEventSystemEnabled() {
			return eventSystemEnabled;
		}
		inline bool getAwardBadgeEnabled() {
			return awardBadgeEnabled;
		}
		inline bool getAwardItemEnabled() {
			return awardItemEnabled;
		}
		inline int getAwardedBadge() {
			return awardedBadge;
		}
		inline String getAwardedItem1() {
			return awardedItem1;
		}
		inline String getAwardedItem2() {
			return awardedItem2;
		}
		};
	}
}
using namespace server::conf;

#endif /* SERVERSETTINGS_H_ */
