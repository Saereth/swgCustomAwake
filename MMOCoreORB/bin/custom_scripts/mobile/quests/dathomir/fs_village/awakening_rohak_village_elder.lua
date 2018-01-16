--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_rohak_village_elder = Creature:new {
	objectName = "@mob/creature_names:fs_villager_elder",
	socialGroup = "fs_villager",
	faction = "fs_villager",
	level = 99,
	chanceHit = 0.29,
	damageMin = 130,
	damageMax = 140,
	baseXp = 430,
	baseHAM = 1170,
	baseHAMmax = 1430,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_fs_village_elder.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "awakeningRohakConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(awakening_rohak_village_elder, "awakening_rohak_village_elder")
