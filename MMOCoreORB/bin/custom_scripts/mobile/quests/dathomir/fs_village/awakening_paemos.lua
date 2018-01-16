--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_paemos = Creature:new {
	objectName = "@mob/creature_names:fs_villager_convert",
	socialGroup = "fs_villager",
	faction = "fs_villager",
	level = 99,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 113,
	baseHAMmax = 138,
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

	templates = {"object/mobile/dressed_fs_converter.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "awakening_paemos_convotemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(awakening_paemos, "awakening_paemos")
