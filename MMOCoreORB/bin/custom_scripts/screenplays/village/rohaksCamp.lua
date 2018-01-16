--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

RohaksCampScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("RohaksCampScreenPlay", true)

function RohaksCampScreenPlay:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnSceneObjects()
		self:spawnMobiles()
	end
end

function RohaksCampScreenPlay:spawnSceneObjects()

	--Camp Objects
	spawnSceneObject("dathomir", "object/building/poi/anywhere_fs_intro_camp.iff", 4899, 78.5, -3800, 0, 0, 0, 0, 0)
	--Rohaks Camp
	spawnSceneObject("dathomir", "object/tangible/camp/camp_light_s1.iff", 4896.3, 78.5, -3804.9, 0, 0, 0, 0, 0)--Light
	spawnSceneObject("dathomir", "object/tangible/camp/camp_light_s1.iff", 4891.3, 78.5, -3811, 0, 0, 0, 0, 0)--Light
	spawnSceneObject("dathomir", "object/tangible/camp/camp_light_s1.iff", 4901.6, 78.5, -3804.9, 0, 0, 0, 0, 0)--Light
	spawnSceneObject("dathomir", "object/tangible/camp/camp_light_s1.iff", 4905.6, 78.5, -3811, 0, 0, 0, 0, 0)--Light

end

function RohaksCampScreenPlay:spawnMobiles()
	--Noldan
	spawnMobile("dathomir", "awakening_noldan", 300, 4900.37, 78.4972, -3808.29, -91, 0)
	--Paemos
	spawnMobile("dathomir", "awakening_paemos", 300, 4900.9, 78.5, -3805.9, -91, 0)
	--Rohak
	spawnMobile("dathomir", "awakening_rohak_village_elder", 300, 4899.1, 78.5, -3800.2, 179, 0)
end
