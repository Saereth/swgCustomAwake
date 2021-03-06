--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_building_player_diner = object_building_player_shared_diner:new {
	lotSize = 3,
	baseMaintenanceRate = 34,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_medium_style_01.iff",
	length = 1,
	width = 1,
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 15}
	},
	childObjects = {
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 3.0, z = 0, y = 4.27, ow = 0.04, ox = 0, oz = 0, oy = 0.99, cellid = 1, containmentType = -1}
	}
}

ObjectTemplates:addTemplate(object_building_player_diner, "object/building/player/diner.iff")
