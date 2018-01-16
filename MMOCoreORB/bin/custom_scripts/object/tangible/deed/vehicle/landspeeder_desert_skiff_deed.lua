--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_tangible_deed_vehicle_deed_landspeeder_desert_skiff_deed = object_tangible_deed_vehicle_deed_shared_landspeeder_desert_skiff_deed:new {

	templateType = VEHICLEDEED,

	controlDeviceObjectTemplate = "object/intangible/vehicle/landspeeder_desert_skiff_pcd.iff",
	generatedObjectTemplate = "object/mobile/vehicle/landspeeder_desert_skiff.iff",

	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "SR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hit_points"},
	experimentalMin = {0, 0, 2500},
	experimentalMax = {0, 0, 4000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 1},
}

ObjectTemplates:addTemplate(object_tangible_deed_vehicle_deed_landspeeder_desert_skiff_deed, "object/tangible/deed/vehicle_deed/landspeeder_desert_skiff_deed.iff")
