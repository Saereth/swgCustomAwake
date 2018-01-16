--This File is part of Core3.
 
--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.
 
--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.
 
--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 
--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.
 
--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.
 
--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 
--which carries forward this exception.

----------------------
--Login Error Messages
----------------------
revisionError = "The client you are attempting to connect with does not match that required by the server."
registerError = "Automatic registration is currently disabled. Please contact the administrators of the server in order to get an authorized account."
activateError = "The server administrators have disabled your account."
passwordError = "The password you entered was incorrect."
bannedError = "Your account has been banned from the server by the administrators.\n\n"

--------------------
--Character Creation
--------------------
charactersPerGalaxy = 10
charactersPerGalaxyError = "You are limited to 10 characters per galaxy."
createTime = 86400000
createTimeError = "You are limited to creating one character every 24 hours. Attempting to create another character or deleting your character before the 24 hour timer expires will reset the timer."
createSuiTitle = "PLEASE NOTE"
createSuiMessage = "You are limited to creating one character every 24 hours. Attempting to create another character or deleting your character before the 24 hour timer expires will reset the timer."

----------------------------------
--Status Server Population Display
----------------------------------
--Enables the population display.
popDisplayEnabled = "false"
--Enables server load(Light, Medium, Heavy, and Very Heavy). Population display must be enabled.
loadDisplayEnabled = "false"

--Number of players connected to trigger each load level.
mediumLoad = 0
heavyLoad = 0
veryHeavyLoad = 0

----------------------
--Auto Server Shutdown
----------------------
--Enables the daily auto shutdown feature.
autoShutdownEnabled = "false"

--Time of day the daily auto shutdown will occur. Shutdown will occur 15 minutes after that time.
hour = 0
minute = 0

----------------------
--Enhancement Terminal
----------------------
--Enables the Enhancement Terminal.
enhancementTerminalEnabled = "false"

--Cost, buff str values and duration. Duration is in seconds.
buffCost= 500
cleanseCost = 500
removeCost = 500
terminalPerformanceBuff = 500
terminalMedicalBuff = 500
terminalPerformaceDuration = 3600
terminalMedicalDuration = 3600

-------------------
--Character Builder
-------------------
--Enables the character builder.
characterBuilderEnabled = "false"
--Enables the character builder for staff only. Character builder must be enabled above.
characterBuilderAdminOnly = "false"

--Buff str values and duration. Duration is in seconds.
builderPerformanceBuff = 1000
builderMedicalBuff = 1900
builderPerformanceDuration = 7200
builderMedicalDuration = 7200 

-------------------------
--Jedi Experience Divisor
--1.0 is default.
-------------------------
jediXpDivisor = 1.0

-------------------------------
--Shrine Jedi Progression Check
-------------------------------
--Enables players to check their Jedi progression at a shrine instead of /check.
shrineProgressionEnabled = "false"

----------------------------
--Galaxy Jedi Unlock Message
----------------------------
--Enables galaxy wide system message when a Jedi unlocks.
unlockMessageEnabled = "false"

--Unlock announcement.
unlockMessage = "Your global Jedi announcement here."

------------------
--Spawn Protection
------------------
--Enables spawn protection for the player upon cloning.
spawnProtectionEnabled = "false"

--Spawn protection time. Time is in miliseconds.
spawnProtectionTime = 0

------------
--TEF System
------------
--Enables the pre patch 13.1 TEF system.
tefEnabled = "false"

--Enables the custom city TEF system. TEF must be enabled above.
cityTefEnabled = "false"

-- Rank required to align a player city with a faction.
cityAlignRankReq = 3

--------------------------
--Faction Base Overt Scanner
--------------------------
--Enables base scanners to set a player to Overt.
overtScannersEnabled = "false"

-------------------------
--Increased House Storage
-------------------------
--Enables increased house storage.
increasedStorageEnabled = "false"

--Determines the item limit based on lots.
twoLots = 250
threeLots = 500
fourLots = 750
fiveLots = 1000

------------------------------
--Post 14.1 Furniture Rotation
------------------------------
--Enables furniture pitch, yaw, and roll.
enableAllRotation = "false"

-----------------------------------------------
--Inactive Player Structure Cleanup
--Destroys a player structure if the owner 
--has not logged in for the defined days below.
-----------------------------------------------
enableInactiveStructureCleanup = 0
inactiveStructureCleanupTime = 0

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
--Define the tangible item template to reward
awardedItem = ""
