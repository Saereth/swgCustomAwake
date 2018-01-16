--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_weapons_rare = {
	description = "",
	minimumLevel = 100,
	maximumLevel = -1,
	lootItems = {
		-- Rare (1/6)
		{itemTemplate = "baton_stun", weight = 350000},
		{itemTemplate = "two_handed_sword_cleaver", weight = 350000},
		{itemTemplate = "axe_vibroaxe", weight = 350000},
		{itemTemplate = "polearm_lance_vibrolance", weight = 350000},
		{itemTemplate = "carbine_ee3", weight = 350000},
		{itemTemplate = "heavy_particle_beam", weight = 350000},
		{itemTemplate = "carbine_laser", weight = 350000},
		{itemTemplate = "rifle_laser", weight = 350000},
		{itemTemplate = "rifle_lightning", weight = 350000},
		{itemTemplate = "heavy_lightning_beam", weight = 350000},
		{itemTemplate = "rifle_spraystick", weight = 350000},
		{itemTemplate = "pistol_sr_combat", weight = 350000},
		{itemTemplate = "grenade_proton", weight = 350000},
		{itemTemplate = "mine_anti_vehicle", weight = 350000},
		{itemTemplate = "heavy_acid_beam", weight = 350000},
		{itemTemplate = "pistol_dx2", weight = 350000},
		{itemTemplate = "carbine_dxr6", weight = 350000},
		{itemTemplate = "carbine_elite", weight = 350000},
		{itemTemplate = "rifle_flame_thrower", weight = 350000},
		{itemTemplate = "rifle_acid_beam", weight = 350000},
		{itemTemplate = "grenade_imperial_detonator", weight = 350000},
		{itemTemplate = "rifle_jawa_ion", weight = 350000},
		{itemTemplate = "polearm_vibro_axe", weight = 350000},
		{itemTemplate = "two_handed_sword_maul", weight = 350000},
		{itemTemplate = "pistol_republic_blaster", weight = 350000},
		{itemTemplate = "heavy_rocket_launcher", weight = 350000},
		{itemTemplate = "rifle_t21", weight = 350000},
		{itemTemplate = "pistol_tangle", weight = 350000},
	}
}

addLootGroupTemplate("awakening_weapons_rare", awakening_weapons_rare)
