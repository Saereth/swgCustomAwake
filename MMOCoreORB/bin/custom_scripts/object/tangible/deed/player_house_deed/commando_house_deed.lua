--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_tangible_deed_player_house_deed_commando_house_deed = object_tangible_deed_player_house_deed_shared_commando_house_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	generatedObjectTemplate = "object/building/player/commando_house.iff",
}

ObjectTemplates:addTemplate(object_tangible_deed_player_house_deed_commando_house_deed, "object/tangible/deed/player_house_deed/commando_house_deed.iff")
