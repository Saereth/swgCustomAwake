--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

local awakeningExperienceConverter = require("custom_scripts.screenplays.village.convos.convohelpers.awakening_experience_converter")
local ObjectManager = require("scripts.managers.object.object_manager")
local QuestManager = require("scripts.managers.quest.quest_manager")
local Logger = require("scripts.utils.logger")

awakeningExperienceConverterConvHandler = Object:new {}

function awakeningExperienceConverterConvHandler:getNextConversationScreen(pConversationTemplate, pConversingPlayer, selectedOption)
	local convosession = CreatureObject(pConversingPlayer):getConversationSession()

	--Has the player completed the quest?
	if not QuestManager.hasCompletedQuest(pConversingPlayer, QuestManager.quests.FS_VILLAGE_ELDER) then
		return conversation:getScreen("not_talk")
	end

	local lastConversationScreen = nil

	if (convosession ~= nil) then
		local session = LuaConversationSession(convosession)
		lastConversationScreen = session:getLastConversationScreen()
	end

	local conversation = LuaConversationTemplate(pConversationTemplate)

	local nextConversationScreen

	if (lastConversationScreen ~= nil) then
		local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)

		--Get the linked screen for the selected option.
		local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)

		nextConversationScreen = conversation:getScreen(optionLink)

		if nextConversationScreen ~= nil then
			local nextLuaConversationScreen = LuaConversationScreen(nextConversationScreen)
		else
			nextConversationScreen = conversation:getScreen("init")
		end
	else
		nextConversationScreen = conversation:getScreen("init")
	end
	return nextConversationScreen
end

function awakeningExperienceConverterConvHandler:runScreenHandlers(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
	local screen = LuaConversationScreen(pConversationScreen)

	local screenID = screen:getScreenID()

	if screenID == "init" then
		pConversationScreen = awakeningExperienceConverterConvHandler.handleInit(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
	elseif screenID == "cs_jsPlumb_1_11" then -- Transferring Experience of first type.
		awakeningExperienceConverterConvHandler:chooseExperienceTypeForRatio(pConversingPlayer, 0)
	elseif screenID == "cs_jsPlumb_1_126" then -- Transferring Experience of second type.
		awakeningExperienceConverterConvHandler:chooseExperienceTypeForRatio(pConversingPlayer, 1)
	elseif screenID == "cs_jsPlumb_1_139" then -- Transferring Experience of third type.
		awakeningExperienceConverterConvHandler:chooseExperienceTypeForRatio(pConversingPlayer, 2)
	elseif screenID == "cs_jsPlumb_1_152" then -- Transferring Experience of fourth type.
		awakeningExperienceConverterConvHandler:chooseExperienceTypeForRatio(pConversingPlayer, 3)
	end
	return pConversationScreen
end

function awakeningExperienceConverterConvHandler:chooseExperienceTypeForRatio(pCreature, experienceType)
	if (pCreature == nil) then
		return
	end

	local options = awakeningExperienceConverter:getExperienceForConversion(pCreature, experienceType)

	local experienceTypeFS = nil
	if (experienceType == 0) then
		experienceTypeFS = "Force-sensitive Combat"
	elseif (experienceType == 1) then
		experienceTypeFS = "Force-sensitive Crafting"
	elseif (experienceType == 2) then
		experienceTypeFS = "Force-sensitive Senses"
	elseif (experienceType == 3) then
		experienceTypeFS = "Force-sensitive Reflex"
	end

	if (#options <= 0) then
		CreatureObject(pCreature):sendSystemMessage("@quest/force_sensitive/utils:convert_not_enough_for_conversion")
		return
	end

	-- Save the option.
	awakeningExperienceConverter:setSuiTransferExperienceType(experienceType, CreatureObject(pCreature):getObjectID())

	if (experienceTypeFS ~= nil) then
		local suiManager = LuaSuiManager()
		suiManager:sendListBox(pCreature, pCreature, "@quest/force_sensitive/utils:xp_transfer_prompt", "Select the Experience you wish to convert to: " .. experienceTypeFS, 2, "@cancel", "", "@ok", "awakeningExperienceConverterConvHandler", "notifyTransfer", options)
	end
end

function awakeningExperienceConverterConvHandler:notifyTransfer(pCreature, pSui, eventIndex, arg0)
	local cancelPressed = (eventIndex == 1)

	if (pCreature == nil or cancelPressed) then
		return
	end

	local objId = CreatureObject(pCreature):getObjectID()

	if (objId == nil) then
		return
	end

	local expTransferType = awakeningExperienceConverter:getSuiTransferExperienceType(objId)

	local optionsName = awakeningExperienceConverter:getExperienceForConversion(pCreature, expTransferType)

	local optionsNameFrom = optionsName[arg0 + 1]
	local optionsNameFromUnformatted = string.sub(optionsNameFrom, 8, string.len(optionsNameFrom))

	local experienceTypeFS = nil

	if (expTransferType == 0) then
		experienceTypeFS = "Force-sensitive Combat"
	elseif (expTransferType == 1) then
		experienceTypeFS = "Force-sensitive Crafting"
	elseif (expTransferType == 2) then
		experienceTypeFS = "Force-sensitive Senses"
	elseif (expTransferType == 3) then
		experienceTypeFS = "Force-sensitive Reflex"
	end

	if (experienceTypeFS ~= nil) then
		-- Save the choice...
		awakeningExperienceConverter:setSuiTransferExperienceSelection(tostring(arg0 + 1), objId)

		-- NEED THE RATIO
		local ratio = awakeningExperienceConverter:getExperienceRatio(optionsNameFromUnformatted, expTransferType)

		-- Add Options: 1 = string name, 2 = amount, 3 = ratio
		local optionsFrom = {}
		ObjectManager.withCreaturePlayerObject(pCreature, function(playerObject)
			optionsFrom = {optionsNameFrom, playerObject:getExperience(optionsNameFromUnformatted), ratio}
		end)
		local optionsTo = {experienceTypeFS, 0, 1}
		local suiManager = LuaSuiManager()
		suiManager:sendTransferBox(pCreature, pCreature, "@quest/force_sensitive/utils:xp_transfer_prompt", "How much of that Experience do you wish to convert to: " .. experienceTypeFS, "@ok", "awakeningExperienceConverterConvHandler", "transferExperiencePoints", optionsTo, optionsFrom)
	end
end

function awakeningExperienceConverterConvHandler:transferExperiencePoints(pCreature, pSui, eventIndex, arg0, arg1)
	local cancelPressed = (eventIndex == 1)

	if (pCreature == nil or cancelPressed) then
		return
	end

	local objId = CreatureObject(pCreature):getObjectID()

	if (objId == nil) then
		return
	end

	local experienceTypeFS = nil
	local expTransferType = awakeningExperienceConverter:getSuiTransferExperienceType(objId)

	if (expTransferType == 0) then
		experienceTypeFS = "@exp_n:fs_combat"
	elseif (expTransferType == 1) then
		experienceTypeFS = "@exp_n:fs_crafting"
	elseif (expTransferType == 2) then
		experienceTypeFS = "@exp_n:fs_senses"
	elseif (expTransferType == 3) then
		experienceTypeFS = "@exp_n:fs_reflex"
	end

	if (arg1 == "0") then
		CreatureObject(pCreature):sendSystemMessage("@quest/force_sensitive/utils:convert_allocate_more_xp")
		return
	end

	if (experienceTypeFS ~= nil) then
		ObjectManager.withCreatureAndPlayerObject(pCreature, function(creatureObject, playerObject)
			local optionsName = awakeningExperienceConverter:getExperienceForConversion(pCreature, awakeningExperienceConverter:getSuiTransferExperienceType(objId))
			local optionsChoice = tonumber(awakeningExperienceConverter:getSuiTransferExperienceSelection(creatureObject:getObjectID()))
			local optionsNameFrom = tostring(optionsName[optionsChoice])
			local optionsNameFromUnformatted = string.sub(optionsNameFrom, 8, string.len(optionsNameFrom))
			awakeningExperienceConverter:deleteSuiTransferExperienceSelection(objId)
			awakeningExperienceConverter:deleteSuiTransferExperienceType(objId)
			local expFsUnformatted = string.sub(experienceTypeFS, 8, string.len(experienceTypeFS))
			local expFsCurrent = playerObject:getExperience(expFsUnformatted)
			local expNormal = playerObject:getExperience(optionsNameFromUnformatted)
			local ratio = awakeningExperienceConverter:getExperienceRatio(optionsNameFromUnformatted, expTransferType)
			local xpToLose = (tonumber(arg1) * ratio) * -1

			-- If they are capped (or will be), don't let them transfer any more xp. The cap for any FS exp type seems to be 5100000.
			if (expFsCurrent >= playerObject:getExperienceCap(expFsUnformatted) or (expFsCurrent + tonumber(arg1) > playerObject:getExperienceCap(expFsUnformatted))) then
				creatureObject:sendSystemMessage("@quest/force_sensitive/utils:convert_at_fs_skill_cap")
				return
			elseif (expNormal + xpToLose < 0) then -- check for negative.
				creatureObject:sendSystemMessage("@quest/force_sensitive/utils:convert_not_enough_xp")
				return
			end

			local messageString = LuaStringIdChatParameter("@quest/force_sensitive/utils:xp_convert_lose")
			local messageString2 = LuaStringIdChatParameter("@quest/force_sensitive/utils:xp_convert_gain")

			messageString:setTO(optionsNameFrom)
			messageString2:setTO(experienceTypeFS)
			messageString2:setDI(tonumber(arg1))
			messageString:setDI(xpToLose * -1)

			creatureObject:awardExperience(optionsNameFromUnformatted, xpToLose, false)
			creatureObject:awardExperience(expFsUnformatted, tonumber(arg1), false)

			creatureObject:sendSystemMessage(messageString:_getObject())
			creatureObject:sendSystemMessage(messageString2:_getObject())
		end)
	end
end

function awakeningExperienceConverterConvHandler.handleInit(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
	local conversationTemplate = LuaConversationTemplate(pConversationTemplate)
	local nextScreen = nil

	-- Paemos - "beckon" animation.
	CreatureObject(pConversingNpc):doAnimation("beckon")

	-- See if they have a quest to unlock, or having XP to convert.
	if (awakeningExperienceConverter.qualifiesForConversation(pConversingPlayer) == true) then
		nextScreen = "cs_jsPlumb_1_5"
	elseif ((awakeningExperienceConverter.qualifiesForConversation(pConversingPlayer) == false) or nextScreen == nil) then
		nextScreen = "cs_jsPlumb_1_19"
	end

	return conversationTemplate:getScreen(nextScreen)
end
