--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

nge_house_hut = {
	description = "",
	minimumLevel = 0,
	maximumLevel = 0,	
	lootItems = {
		{itemTemplate = "nge_hut_house_deed", weight = 10000000},	
	}
}

addLootGroupTemplate("nge_house_hut", nge_house_hut)
