--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_tangible_deed_player_house_deed_generic_medium_window_s01_deed = object_tangible_deed_player_house_deed_shared_generic_medium_window_s01_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	generatedObjectTemplate = "object/building/player/generic_medium_window_s01.iff",
}

ObjectTemplates:addTemplate(object_tangible_deed_player_house_deed_generic_medium_window_s01_deed, "object/tangible/deed/player_house_deed/generic_medium_window_s01_deed.iff")
