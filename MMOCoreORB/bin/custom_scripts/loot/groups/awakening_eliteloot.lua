--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_eliteloot = {
	description = "",
	minimumLevel = 15,
	maximumLevel = -1,	
	lootItems = {
		{groupTemplate = "window_houses", weight = 8000000},
		{itemTemplate = "nge_bespin_house_scheme", weight = 250000},
		{itemTemplate = "nge_commando_house_scheme", weight = 250000},
		{itemTemplate = "nge_mustafar_house_scheme", weight = 250000},
		{itemTemplate = "nge_jabba_house_scheme", weight = 200000},
		{itemTemplate = "nge_hut_house_deed", weight = 200000},
		{itemTemplate = "nge_vehicle_house_scheme", weight = 200000},
		{itemTemplate = "nge_yt1300_house_scheme", weight = 200000},
		{itemTemplate = "nge_sand_crawler_house_scheme", weight = 200000},
		{itemTemplate = "nge_tree_house_scheme", weight = 200000},
		{itemTemplate = "rebel_spire_scheme", weight = 25000},
		{itemTemplate = "imperial_spire_scheme", weight = 25000}
	}
}

addLootGroupTemplate("awakening_eliteloot", awakening_eliteloot)
