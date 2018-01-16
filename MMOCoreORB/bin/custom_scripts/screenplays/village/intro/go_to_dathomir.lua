--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

local ObjectManager = require("scripts.managers.object.object_manager")
local QuestManager = require("scripts.managers.quest.quest_manager")
require("scripts.utils.helpers")

GoToDathomir = GoToLocation:new {
	-- Task properties
	taskName = "GoToDathomir",
	-- GoToLocation properties
	waypointDescription = "@quest/force_sensitive/intro:goto_dath_sum",
	spawnPoint = { x = 4899.1, y = -3800.2 },
	spawnPlanet = "dathomir",
	spawnRadius = 5,
	onFailedSpawn = nil,
	onSuccessfulSpawn = nil,
	onEnteredActiveArea = nil
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pCreatureObject pointer to the creature object of the player.
function GoToDathomir:onEnteredActiveArea(pCreatureObject)
	if (pCreatureObject == nil) then
		return
	end

	QuestManager.completeQuest(pCreatureObject, QuestManager.quests.FS_VILLAGE_ELDER)
	self:finish(pCreatureObject)
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pCreatureObject pointer to the creature object of the player.
function GoToDathomir:onSuccessfulSpawn(pCreatureObject)
	if (pCreatureObject == nil) then
		return
	end

	QuestManager.activateQuest(pCreatureObject, QuestManager.quests.FS_VILLAGE_ELDER)
end

return GoToDathomir
