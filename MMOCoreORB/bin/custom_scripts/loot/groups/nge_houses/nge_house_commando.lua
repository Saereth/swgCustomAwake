--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

nge_house_commando = {
	description = "",
	minimumLevel = 0,
	maximumLevel = 0,	
	lootItems = {
		{itemTemplate = "nge_commando_house_scheme", weight = 10000000},	
	}
}

addLootGroupTemplate("nge_house_commando", nge_house_commando)
