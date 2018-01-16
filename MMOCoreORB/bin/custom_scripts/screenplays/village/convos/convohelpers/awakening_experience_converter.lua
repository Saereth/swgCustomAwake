--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

local ObjectManager = require("scripts.managers.object.object_manager")
local Logger = require("scripts.utils.logger")
require("scripts.utils.helpers")
require("scripts.screenplays.screenplay")

-- These are the 3 types of FS experience for regex searches, full strings not needed for each type, just least specific.
local XpCombat =
{
	{"combat_general", 3},
	{"squadleader", 90},
	{"bountyhunter", 3},
	{"combat_melee", 30},
	{"combat_ranged", 30}
}

local XpSenses =
{
	{"bio_engineer_dna_harvesting", 3},
	{"political", 3},
	{"slicing", 3},
	{"merchant", 4},
	{"resource_harvesting_inorganic", 5},
	{"imagedesigner", 7},
	{"scout", 8},
	{"creaturehandler", 9},
	{"dance", 10},
	{"music", 10},
	{"entertainer_healing", 10},
	{"camp", 10},
	{"medical", 10},
	{"trapping", 25}
}

local XpCrafting =
{
	{"crafting_bio_engineer_creature", 4},
	{"crafting_bio_engineer_tissue", 5},
	{"crafting_c", 5},
	{"crafting_d", 5},
	{"crafting_f", 5},
	{"crafting_m", 5},
	{"crafting_sc", 5},
	{"crafting_sp", 5},
	{"crafting_w", 5},
	{"crafting_general", 8},
	{"crafting_structure_general", 35}
}

awakeningExperienceConverter = Object:new {}

-- Since the logic flow of the conversation calls set always before get, it should work, but just in case...
function awakeningExperienceConverter:setSuiTransferExperienceSelection(var, oid)
	if (readStringData("suiTransferExperienceSelection:" .. oid) ~= nil) then
		deleteStringData("suiTransferExperienceSelection:"  .. oid)
	end
	if (var ~= nil) then
		writeStringData("suiTransferExperienceSelection:"  .. oid, var)
	end
end

function awakeningExperienceConverter:getSuiTransferExperienceSelection(oid)
	return readStringData("suiTransferExperienceSelection:"  .. oid)
end

function awakeningExperienceConverter:deleteSuiTransferExperienceSelection(oid)
	return deleteStringData("suiTransferExperienceSelection:"  .. oid)
end


function awakeningExperienceConverter:setSuiTransferExperienceType(var, oid)
	if (readData("suiTransferExperienceType:" .. oid) ~= nil) then
		deleteData("suiTransferExperienceType:"  .. oid)
	end
	if (var ~= nil) then
		writeData("suiTransferExperienceType:"  .. oid, var)
	end
end

function awakeningExperienceConverter:getSuiTransferExperienceType(oid)
	return readData("suiTransferExperienceType:"  .. oid)
end

function awakeningExperienceConverter:deleteSuiTransferExperienceType(oid)
	return deleteData("suiTransferExperienceType:"  .. oid)
end

-- See if the player qualifies for the conversion.
-- @param pPlayerObject pointer to the player object of the player.
-- @return a boolean.
function awakeningExperienceConverter.qualifiesForConversation(pCreatureObject)
	-- TODO: Research why Paemos wouldn't converse with player.
	if (pCreatureObject == nil) then
		return false
	end

	return true
end

function awakeningExperienceConverter:getExperienceForConversion(pCreature, theType)

	if (pCreature == nil) then
		return nil
	end

	local returnTable = {}

	local inputTable = {}

	if (theType == 0 or theType == 3) then
		inputTable = XpCombat
	elseif (theType == 1) then
		inputTable = XpCrafting
	elseif (theType == 2) then
		inputTable = XpSenses
	end

	local expList = {}

	ObjectManager.withCreaturePlayerObject(pCreature, function(playerObject)
		expList = playerObject:getExperienceList()
	end)

	if (expList == nil) then
		return nil
	end

	for i = 1, #expList do
		if (self:containsKey(inputTable, expList[i])) then
			table.insert(returnTable, "@exp_n:" .. expList[i])
		end
	end

	return returnTable

end

function awakeningExperienceConverter:getExperienceRatio(experienceType, theType)

	local returnAmount = nil

	local inputTable = {}

	if (theType == 0 or theType == 3) then
		inputTable = XpCombat
	elseif (theType == 1) then
		inputTable = XpCrafting
	elseif (theType == 2) then
		inputTable = XpSenses
	end


	returnAmount = self:getValue(inputTable, experienceType)

	if (returnAmount == nil) then
		return 0
	end

	return returnAmount
end


-- Generic search function for the strings in the tables above.
function awakeningExperienceConverter:containsKey(table, element)
	for i = 1, #table do
		if (string.find(element, table[i][1]) ~= nil) then
			return true
		end
	end
	return false
end

-- Generic search function for the ratio in the tables above.
function awakeningExperienceConverter:getValue(table, element)
	for i = 1, #table do
		if (string.find(element, table[i][1]) ~= nil) then
			return table[i][2]
		end
	end
end

return awakeningExperienceConverter
