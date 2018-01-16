--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

local ObjectManager = require("scripts.managers.object.object_manager")
local QuestManager = require("scripts.managers.quest.quest_manager")
local CRYSTAL_OBJECT = "object/tangible/loot/quest/force_sensitive/force_crystal.iff"

awakeningRohhakConvHandler = Object:new {}

-- Sui window ok pressed callback function.
function awakeningRohhakConvHandler:notifyOkPressed()
-- Do nothing.
end

function awakeningRohhakConvHandler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	local creature = LuaCreatureObject(conversingPlayer)
	local convosession = creature:getConversationSession()
	local conversation = LuaConversationTemplate(conversationTemplate)
	local completedQuest = QuestManager.hasCompletedQuest(conversingPlayer, QuestManager.quests.FS_VILLAGE_ELDER)
	local pInventory = CreatureObject(conversingPlayer):getSlottedObject("inventory")
	local pInvItem = getContainerObjectByTemplate(pInventory, CRYSTAL_OBJECT, true)
	local nextConversationScreen

	if pInventory == nil then
		return conversation:getScreen("not_talk")
	end

	--Has the player completed the quest?
	if not QuestManager.hasCompletedQuest(conversingPlayer, QuestManager.quests.FS_VILLAGE_ELDER) then
		return conversation:getScreen("not_talk")
	end

	--Does the player have the force crystal?
	if (pInvItem == nil ) then
		return conversation:getScreen("not_talk")
	end

	--Get previous convo screen.
	if ( conversation ~= nil ) then
		if ( convosession ~= nil ) then
			local session = LuaConversationSession(convosession)
			if ( session ~= nil ) then
				lastConversationScreen = session:getLastConversationScreen()
			end
		end

		--Get initial screen.
		if ( lastConversationScreen == nil ) then
			nextConversationScreen = conversation:getInitialScreen()
		else
			local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
			local screen = LuaConversationScreen(nextConversationScreen)
			local screenID = luaLastConversationScreen:getScreenID()
			local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
			local suiManager = LuaSuiManager()
			nextConversationScreen = conversation:getScreen(optionLink)

			--Grant Jedi if seek shrine option is selected.
			--The player will only get to this step if the above conditions are false.
			if (screenID == "what_can_i_do" ) then
				if (optionLink == "train_fs") then
					CreatureObject(conversingPlayer):setScreenPlayState(1, "VillageElderScreenPlay")
					SceneObject(pInvItem):destroyObjectFromWorld()
					SceneObject(pInvItem):destroyObjectFromDatabase()

					local pGhost = CreatureObject(conversingPlayer):getPlayerObject()
					local suiManager = LuaSuiManager()
					
					if (not PlayerObject(pGhost):isJedi()) then
						PlayerObject(pGhost):setJediState(1)
						awardSkill(conversingPlayer, "force_title_jedi_novice")
						suiManager:sendMessageBox(conversingPlayer, conversingPlayer, "Ways Of The Force", "I can sense that the force is strong with you. Normally I would welcome you to the Village of Aurilla, but the dangers are far too great for a young force sensitive such as yourself. Our village is under attack by the witches of Dathomir and most of the villagers within have fled. We are trying very hard to restore order and form a truce, but so far the witches will hear none of it and each clan is vying for control.\n\n I am sure you are wondering how to continue your journey... Talk with Paemos in this camp to further your training. He will help you convert your various life experiences in order to advance your force sensitivity. Noldan, also in this camp, will train your Force Sensitive skills once your force sensitivity is high enough.\n\n May the force be with you!", "@ok", "awakeningRohhakConvHandler", "notifyOkPressed")
					else
						suiManager:sendMessageBox(conversingPlayer, conversingPlayer, "Ways Of The Force", "I sense that you have already begun down your Jedi path. May the Force be with you and guide you on your journey.", "@ok", "awakeningRohhakConvHandler", "notifyOkPressed")
					end
				end
			end
		end
	end
	return nextConversationScreen
end
function awakeningRohhakConvHandler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	return conversationScreen
end
