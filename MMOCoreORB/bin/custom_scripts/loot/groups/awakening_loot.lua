--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_loot = {
	description = "",
	minimumLevel = 10,
	maximumLevel = -1,	
	lootItems = {
		{itemTemplate = "force_color_crystal", weight = 10000000}
	}
}

addLootGroupTemplate("awakening_loot", awakening_loot)
