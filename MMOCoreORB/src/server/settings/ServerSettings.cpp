/*
 *	SWG Awakening Custom -- ServerSettings.Cpp
 *	Copyright (C) <SWG Awakening>
 */

#include "ServerSettings.h"

bool useCustom = false;
ServerSettings::ServerSettings() {
	//Login Error Message Config
	revisionError = "The client you are attempting to connect with does not match that required by the server.";
	registerError = "Automatic registration is currently disabled. Please contact the administrators of the server in order to get an authorized account.";
	activateError = "The server administrators have disabled your account.";
	passwordError = "The password you entered was incorrect.";
	bannedError = "Your account has been banned from the server by the administrators.\n\n";

	//Character Creation Config
	charactersPerGalaxy = 10;
	charactersPerGalaxyError = "You are limited to 10 characters per galaxy.";
	createTime = 86400000;
	createTimeError = "You are limited to creating one character every 24 hours. Attempting to create another character or deleting your character before the 24 hour timer expires will reset the timer.";
	createSuiTitle = "PLEASE NOTE";
	createSuiMessage = "You are limited to creating one character every 24 hours. Attempting to create another character or deleting your character before the 24 hour timer expires will reset the timer.";

	//Status Server Population Display Config
	popDisplayEnabled = false;
	loadDisplayEnabled = false;
	mediumLoad = 0;
	heavyLoad = 0;
	veryHeavyLoad = 0;

	//Auto Shutdown Config
	autoShutdownEnabled = false;
	hour = 0;
	minute = 0;

	//Enhancement Terminal Config
	enhancementTerminalEnabled = false;
	buffCost= 500;
	cleanseCost = 500;
	removeCost = 500;
	terminalPerformanceBuff = 500;
	terminalMedicalBuff = 500;
	terminalPerformaceDuration = 3600;
	terminalMedicalDuration = 3600;

	//Character Builder Config
	characterBuilderEnabled = false;
	characterBuilderAdminOnly = false;
	builderPerformanceBuff = 1000;
	builderMedicalBuff = 1900;
	builderPerformanceDuration = 7200;
	builderMedicalDuration = 7200;

	//Jedi Unlock Config
	column1 = "column1";
	column2 = "column2";
	column3 = "column3";
	column4 = "column4";
	column5 = "column5";
	column6 = "column6";
	column7 = "column7";
	column8 = "column8";
	column9 = "column9";
	column10 = "column10";
	column11 = "column11";
	column12 = "column12";
	rand1 = 0;
	rand2 = 0;
	rand3 = 0;
	rand4 = 0;
	rand5 = 0;
	rand6 = 0;
	rand7 = 0;
	rand8 = 0;
	rand9 = 0;

	//Jedi Experience Divisor Config
	jediXpDivisor = 1.0;

	//Shrine Jedi Progression Check Config
	shrineProgressionEnabled = false;

	//Galaxy Jedi Unlock Message Config
	unlockMessageEnabled = false;
	unlockMessage = "IMPERIAL COMMUNICATION FROM THE REGIONAL GOVERNOR: Lord Vader has detected a vergence in the Force.\n Be on the lookout for any suspicious persons displaying unique or odd abilities. Lord Vader authorizes all citizens to use deadly force to eliminate this threat to the Empire.";

	//Spawn Protection Config
	spawnProtectionEnabled = false;
	spawnProtectionTime = 0;

	//TEF System Config
	tefEnabled = false;
	cityTefEnabled = false;

	//City Alignment Config
	cityAlignRankReq = 0;

	//Faction Base TEF Scanner Config
	overtScannersEnabled = false;

	//Increased House Storage Config
	increasedStorageEnabled = false;
	twoLots = 0;
	threeLots = 0;
	fourLots = 0;
	fiveLots = 0;

	//Inactive Player Structure Cleanup
	enableInactiveStructureCleanup = false;
	inactiveStructureCleanupTime = 0;

	//Post 14.1 Furniture Rotation Config
	allRotationEnabled = false;

	//Event System Config
	eventSystemEnabled = false;
	awardBadgeEnabled = false;
	awardItemEnabled = false;
	awardedBadge = 0;
	awardedItem1 = "";
	awardedItem2 = "";
}
	bool ServerSettings::loadServerSettingsData() {

		if (!loadServerSettingsFile())
			return false;

	//Login Error Message Config
	revisionError = getGlobalString("revisionError");
	registerError = getGlobalString("registerError");
	activateError = getGlobalString("activateError ");
	passwordError = getGlobalString("passwordError");
	bannedError = getGlobalString("bannedError");

	//Character Creation Config
	charactersPerGalaxy = getGlobalInt("charactersPerGalaxy");
	charactersPerGalaxyError = getGlobalString("charactersPerGalaxyError");
	createTime = getGlobalInt("createTime");
	createTimeError = getGlobalString("createTimeError");
	createSuiTitle = getGlobalString("createSuiTitle");
	createSuiMessage = getGlobalString("createSuiMessage");

	//Status Server Population Display Config
	popDisplayEnabled = getGlobalBoolean("popDisplayEnabled");
	loadDisplayEnabled = getGlobalBoolean("loadDisplayEnabled");
	mediumLoad = getGlobalInt("mediumLoad");
	heavyLoad = getGlobalInt("heavyLoad");
	veryHeavyLoad = getGlobalInt("veryHeavyLoad");

	//Auto Shutdown Config
	autoShutdownEnabled = getGlobalBoolean("autoShutdownEnabled");
	hour = getGlobalInt("hour");
	minute = getGlobalInt("minute");

	//Enhancement Terminal Config
	enhancementTerminalEnabled = getGlobalBoolean("enhancementTerminalEnabled");
	buffCost = getGlobalInt("buffCost");
	cleanseCost = getGlobalInt("cleanseCost");
	removeCost = getGlobalInt("removeCost");
	terminalPerformanceBuff = getGlobalInt("terminalPerformanceBuff");
	terminalMedicalBuff = getGlobalInt("terminalMedicalBuff");
	terminalPerformaceDuration = getGlobalInt("terminalPerformaceDuration");
	terminalMedicalDuration = getGlobalInt("terminalMedicalDuration");

	//Character Builder Config
	characterBuilderEnabled = getGlobalBoolean("characterBuilderEnabled");
	characterBuilderAdminOnly = getGlobalBoolean("characterBuilderAdminOnly");
	builderPerformanceBuff = getGlobalInt("builderPerformanceBuff");
	builderMedicalBuff = getGlobalInt("builderMedicalBuff");
	builderPerformanceDuration = getGlobalInt("builderPerformanceDuration");
	builderMedicalDuration = getGlobalInt("builderMedicalDuration");

	//Galaxy Jedi Unlock Message Config
	column1 = getGlobalString("column1");
	column2 = getGlobalString("column2");
	column3 = getGlobalString("column3");
	column4 = getGlobalString("column4");
	column5 = getGlobalString("column5");
	column6 = getGlobalString("column6");
	column7 = getGlobalString("column7");
	column8 = getGlobalString("column8");
	column9 = getGlobalString("column9");
	column10 = getGlobalString("column10");
	column11 = getGlobalString("column11");
	column12 = getGlobalString("column12");
	rand1 = getGlobalInt("rand1");
	rand2 = getGlobalInt("rand2");
	rand3 = getGlobalInt("rand3");
	rand4 = getGlobalInt("rand4");
	rand5 = getGlobalInt("rand5");
	rand6 = getGlobalInt("rand6");
	rand7 = getGlobalInt("rand7");
	rand8 = getGlobalInt("rand8");
	rand9 = getGlobalInt("rand9");

	//Jedi Experience Divisor Config
	jediXpDivisor = getGlobalFloat("jediXpDivisor");

	//Shrine Jedi Progression Check Config
	shrineProgressionEnabled = getGlobalBoolean("shrineProgressionEnabled");

	//Unlock Message Config
	unlockMessageEnabled = getGlobalBoolean("unlockMessageEnabled");
	unlockMessage = getGlobalString("unlockMessage");

	//Spawn Protection Config
	spawnProtectionEnabled = getGlobalBoolean("spawnProtectionEnabled");
	spawnProtectionTime = getGlobalInt("spawnProtectionTime");

	//TEF System Config
	tefEnabled = getGlobalBoolean("tefEnabled");
	cityTefEnabled = getGlobalBoolean("cityTefEnabled");

	//City Alignment Config
	cityAlignRankReq = getGlobalInt("cityAlignRankReq");

	//Faction Base Overt Scanner Config
	overtScannersEnabled = getGlobalBoolean("overtScannersEnabled");

	//Increased House Storage Config
	increasedStorageEnabled = getGlobalBoolean("increasedStorageEnabled");
	twoLots = getGlobalInt("twoLots");
	threeLots = getGlobalInt("threeLots");
	fourLots = getGlobalInt("fourLots");
	fiveLots = getGlobalInt("fiveLots");

	//Inactive Player Structure Cleanup
	enableInactiveStructureCleanup = getGlobalBoolean("enableInactiveStructureCleanup");
	inactiveStructureCleanupTime = getGlobalInt("inactiveStructureCleanupTime");

	//Post 14.1 Furniture Rotation Config
	allRotationEnabled = getGlobalBoolean("enableAllRotation");

	//Event System Config
	eventSystemEnabled = getGlobalBoolean("eventSystemEnabled");
	awardBadgeEnabled = getGlobalBoolean("awardBadgeEnabled");
	awardItemEnabled = getGlobalBoolean("awardItemEnabled");
	awardedBadge = getGlobalInt("awardedBadge");
	awardedItem1 = getGlobalString("awardedItem1");
	awardedItem2 = getGlobalString("awardedItem2");

	return true;
}
