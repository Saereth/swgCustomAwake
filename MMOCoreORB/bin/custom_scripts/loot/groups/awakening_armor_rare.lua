--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_armor_rare = {
	description = "",
	minimumLevel = 100,
	maximumLevel = -1,
	lootItems = {
		-- Rare
		{itemTemplate = "composite_armor_bicep_l", weight = 450001},
		{itemTemplate = "composite_armor_bicep_r", weight = 450001},
		{itemTemplate = "composite_armor_boots", weight = 450001},
		{itemTemplate = "composite_armor_bracer_l", weight = 450001},
		{itemTemplate = "composite_armor_bracer_r", weight = 450001},
		{itemTemplate = "composite_armor_chest_plate", weight = 450001},
		{itemTemplate = "composite_armor_gloves", weight = 450001},
		{itemTemplate = "composite_armor_helmet", weight = 450001},
		{itemTemplate = "composite_armor_leggings", weight = 450001},
		{itemTemplate = "ithorian_sentinel_armor_bicep_l", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_bicep_r", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_boots", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_bracer_l", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_bracer_r", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_chest_plate", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_gloves", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_helmet", weight = 450000},
		{itemTemplate = "ithorian_sentinel_armor_leggings", weight = 450000},
		{itemTemplate = "kashyyykian_hunting_armor_bracer_l", weight = 450000},
		{itemTemplate = "kashyyykian_hunting_armor_bracer_r", weight = 450000},
		{itemTemplate = "kashyyykian_hunting_armor_chest_plate", weight = 450000},
		{itemTemplate = "kashyyykian_hunting_armor_leggings", weight = 450000},
	}
}

addLootGroupTemplate("awakening_armor_rare", awakening_armor_rare)
