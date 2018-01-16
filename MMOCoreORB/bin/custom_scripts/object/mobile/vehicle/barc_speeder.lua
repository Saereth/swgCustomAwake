--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_mobile_vehicle_barc_speeder = object_mobile_vehicle_shared_barc_speeder:new {
	templateType = VEHICLE,
	decayRate = 35, -- Damage tick per decay cycle
	decayCycle = 600 -- Time in seconds per cycle
}

ObjectTemplates:addTemplate(object_mobile_vehicle_barc_speeder, "object/mobile/vehicle/barc_speeder.iff")
