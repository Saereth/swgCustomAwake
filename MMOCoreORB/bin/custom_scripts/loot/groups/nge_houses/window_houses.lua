--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

window_houses = {
	description = "",
	minimumLevel = 0,
	maximumLevel = 0,	
	lootItems = {
		{itemTemplate = "nge_gen_lg_win_01_scheme", weight = 1250000},
		{itemTemplate = "nge_gen_lg_win_02_scheme", weight = 1250000},
		{itemTemplate = "nge_gen_md_win_01_scheme", weight = 1250000},
		{itemTemplate = "nge_gen_md_win_02_scheme", weight = 1250000},
		{itemTemplate = "nge_gen_sm_win_01_scheme", weight = 1250000},
		{itemTemplate = "nge_gen_sm_win_02_scheme", weight = 1250000},
		{itemTemplate = "nge_nab_sm_win_01_scheme", weight = 1250000},
		{itemTemplate = "nge_tat_sm_win_01_scheme", weight = 1250000}
	}
}

addLootGroupTemplate("window_houses", window_houses)
