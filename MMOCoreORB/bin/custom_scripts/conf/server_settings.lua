--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

----------------------
--Login Error Messages
----------------------
revisionError = "The client you are attempting to connect with does not match the required version. Please run the Awakening Launcher to update your client."
registerError = "Account does not exist. Please visit http://www.swgawakening.com to register for an account."
activateError = "You will need to activate your account before playing. Click on the activation link that was sent to you via email when you registered. If you did not get an email, please contact support@swgawakening.com."
passwordError = "The password you entered was incorrect."
bannedError = "Your account has been banned. If you think this was done in error, or you wish to appeal your ban, send an email to support@swgawakening.com."


--------------------
--Character Creation
--------------------
charactersPerGalaxy = 10
charactersPerGalaxyError = "You are limited to 10 characters per galaxy."

createTime = 1800000
createTimeError = "You are only permitted to create one character every 30 minutes. Repeated attempts prior to 30 minutes elapsing will reset the timer."

createSuiTitle = "Welcome to Awakening!"
createSuiMessage = "Please note: you are limited to creating one character every 30 minutes. Attempting to create another character or deleting your character before the 30 minute timer expires will reset the timer."

----------------------------------
--Status Server Population Display
----------------------------------
--Enables the population display
popDisplayEnabled = "true" --Enables population display.
--Enables server load(Light, Medium, Heavy, and Very Heavy). Population display must be enabled.
loadDisplayEnabled = "true" --Enables server load instad of population count.

--Number of players connected to trigger each load level.
mediumLoad = 120
heavyLoad = 300
veryHeavyLoad = 500

----------------------
--Auto Server Shutdown
----------------------
--Enables the daily auto shutdown feature.
autoShutdownEnabled = "true"

--Time of day the daily auto shutdown will occur. Shutdown will occur 15 minutes after that time.
hour = 5
minute = 45

----------------------
--Enhancement Terminal
----------------------
--Enables the Enhancement Terminal.
enhancementTerminalEnabled = "true"

--Cost, buff str values and duration. Duration is in seconds.
buffCost= 2000
cleanseCost = 10000
removeCost = 2000
terminalPerformanceBuff = 500
terminalMedicalBuff = 500
terminalPerformaceDuration = 3600
terminalMedicalDuration = 3600

-------------------
--Character Builder
-------------------
--Enables the character builder.
characterBuilderEnabled = "true"
--Enables the character builder for staff only. Character builder must be enabled above.
characterBuilderAdminOnly = "true"

--Buff str values and duration. Duration is in seconds.
builderPerformanceBuff = 2000
builderMedicalBuff = 2500
builderPerformanceDuration = 7200
builderMedicalDuration = 7200

-----------------------
--Jedi Unlock Variables
-----------------------
--Real Columns
column1 = "jedi_badges"
column2 = "diff_badges"
column3 = "easy_badges"
column4 = "prof_badges"
column5 = "cont_badges"
column6 = "age_required"

--Dummy Columns
column7 = "d1"
column8 = "d2"
column9 = "d3"
column10 = "d4"
column11 = "d5"
column12 = "d6"

--Random Numbers
rand1 = 2
rand2 = 3
rand3 = 5
rand4 = 10
rand5 = 20
rand6 = 25
rand7 = 30
rand8 = 120
rand9 = 300

-------------------------
--Jedi Experience Divisor
--1.0 is default.
-------------------------
jediXpDivisor = 6.0

-------------------------------
--Shrine Jedi Progression Check
-------------------------------
--Enables players to check their Jedi progression at a shrine instead of /check.
shrineProgressionEnabled = "true"

----------------------------
--Galaxy Jedi Unlock Message
----------------------------
--Enables galaxy wide system message when a Jedi unlocks.
unlockMessageEnabled = "true"

--Unlock announcement.
unlockMessage = "IMPERIAL COMMUNICATION FROM THE REGIONAL GOVERNOR: Lord Vader has detected a vergence in the Force.\n Be on the lookout for any suspicious persons displaying unique or odd abilities. Lord Vader authorizes all citizens to use deadly force to eliminate this threat to the Empire."

------------------
--Spawn Protection
------------------
--Enables spawn protection for the player upon cloning.
spawnProtectionEnabled = "true"

--Spawn protection time. Time is in miliseconds.
spawnProtectionTime = 60000

------------
--TEF System
------------
--Enables the pre patch 13.1 TEF system.
tefEnabled = "true"

--Enables the custom city TEF system. TEF must be enabled.
cityTefEnabled = "true"

-- Rank required to align a player city with a faction.
cityAlignRankReq = 4

--------------------------
--Faction Base TEF Scanner
--------------------------
--Enables base scanners to TEF a player. TEF must be enabled above.
overtScannersEnabled = "true"

--------------------------------
--Increased House Storage
--------------------------------
--Enables increased house storage.
increasedStorageEnabled = "true"

--Item limits based on lot size.
twoLots = 300
threeLots = 600
fourLots = 900
fiveLots = 1200

--------------------------------
--Post 14.1 Furniture Rotation
--------------------------------
--Enables furniture pitch, yaw, and roll.
enableAllRotation = "true"

-----------------------------------------------
--Inactive Player Structure Cleanup
--Destroys a player structure if the owner 
--has not logged in for the defined days below.
-----------------------------------------------
enableInactiveStructureCleanup = "true"
inactiveStructureCleanupTime = 365

----------------------------
--SWG Awakening Event System
----------------------------
--Enables the event system
eventSystemEnabled = "false"

--Enables badge reward
awardBadgeEnabled = "false"
--Define the badge number to reward
awardedBadge = 0

--Enables item reward
awardItemEnabled = "false"
--Define the tangible item templates to reward
awardedItem1 = ""
awardedItem2 = ""
