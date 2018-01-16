BorgleBatCaveScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "BorgleBatCaveScreenPlay",

	lootContainers = {
		8795683,
		8795684,
		8795685,
		8795686,
		8795687,
		8795688,
		8795689
        },
        
        lootLevel = 13, 
 
        lootGroups = {
                {
                        groups = {
                                {group = "junk", chance = 4800000},
                                {group = "melee_weapons", chance = 600000},
				{group = "pistols", chance = 200000},
				{group = "carbines", chance = 200000},
				{group = "rifles", chance = 200000},
                                {group = "clothing_attachments", chance = 2000000},
                                {group = "armor_attachments", chance = 2000000}
                        },
                        lootChance = 8000000
                }                                       
        },
        
        lootContainerRespawn = 1800 -- 30 minutes
}

registerScreenPlay("BorgleBatCaveScreenPlay", true)

function BorgleBatCaveScreenPlay:start()
	if (isZoneEnabled("rori")) then
                self:spawnMobiles()
                self:initializeLootContainers()
        end
end

function BorgleBatCaveScreenPlay:spawnMobiles()
	--SWG Awakening Custom -- Spawns For Cave Grinders
	spawnMobile("rori", "scientist", 60,  34.0, -45.7, -63.3, -4, 5407166)
	spawnMobile("rori", "scientist", 60,  -73.5, -70.6, -148.1, -177, 5407170)

	--SWG Awakening Custom, Modified All Spawn Values, 360 to 900
	spawnMobile("rori", "borgle_harvester", 900,  874.9, 85.3, -4906.9, 137, 0)
	spawnMobile("rori", "borgle_harvester", 900,  875.0, 85.2, -4903.8, 137, 0)
	spawnMobile("rori", "borgle_harvester", 900,  871.1, 85.1, -4907.3, 137, 0)

	spawnMobile("rori", "borgle_harvester", 900,  10.3, -23.5, -25.1, -8, 5407164)
	spawnMobile("rori", "borgle_harvester", 900,  12.1, -23.4, -26.6, -9, 5407164)
	spawnMobile("rori", "borgle_harvester", 900,  8.7, -23.9, -26.3, -6, 5407164)

	spawnMobile("rori", "borgle_harvester", 900,  1.3, -40.5, -68.9, -43, 5407165)
	spawnMobile("rori", "borgle_harvester", 900,  0.5, -40.7, -71.1, -23, 5407165)
	spawnMobile("rori", "borgle_harvester", 900,  3.3, -40.6, -70.2, -15, 5407165)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  45.5, -46.2, -95.0, -47, 5407166)
	spawnMobile("rori", "borgle_harvester", 900,  49.1, -46.1, -96.5, -26, 5407166)
	spawnMobile("rori", "borgle_harvester", 900,  44.4, -46.1, -97.5, -26, 5407166)

	spawnMobile("rori", "borgle_harvester", 900,  -4.8, -45.1, -137.7, 39, 5407167)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -4.2, -45.1, -141.0, 40, 5407167)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -7.9, -44.9, -138.1, 38, 5407167)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  54.5, -49.4, -131.9, -85, 5407167)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  58.6, -48.7, -130.1, -82, 5407167)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  55.9, -50.0, -134.9, -58, 5407167)

	spawnMobile("rori", "borgle_protector", 900,  46.1, -56.3, -180.9, -14, 5407167)
	spawnMobile("rori", "borgle_harvester", 900,  47.5, -56.4, -184.1, 20, 5407167)
	spawnMobile("rori", "borgle_harvester", 900,  43.1, -56.8, -183.8, -12, 5407167)

	spawnMobile("rori", "borgle_protector", 900,  -8.4, -64.0, -180.9, 86, 5407168)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -11.1, -64.3, -178.5, 90, 5407168)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -10.2, -63.9, -184.4, 70, 5407168)

	spawnMobile("rori", "borgle_protector", 900,  -6.1, -64.2, -234.2, -20, 5407169)
	spawnMobile("rori", "borgle_harvester", 900,  -8.8, -64.8, -237.1, -13, 5407169)
	spawnMobile("rori", "borgle_harvester", 900,  -2.8, -64.0, -235.5, -32, 5407169)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  -60.6, -69.9, -192.0, 35, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -59.5, -69.9, -194.4, 27, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -64.7, -69.6, -192.3, 42, 5407170)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  -114.1, -69.0, -170.2, 87, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -119.2, -69.0, -167.8, 78, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -117.4, -69.6, -174.9, 73, 5407170)

	spawnMobile("rori", "borgle_protector", 900,  -99.3, -70.3, -118.0, 168, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -101.4, -69.6, -115.3, 178, 5407170)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -96.4, -70.6, -116.1, -176, 5407170)

	spawnMobile("rori", "borgle_protector", 900,  -62.2, -70.5, -85.5, -115, 5407171)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -60.6, -70.3, -82.3, -103, 5407171)
	spawnMobile("rori", "blood_thirsty_borgle", 900,  -59.6, -70.1, -88.1, -93, 5407171)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  -36.7, -70.6, -108.3, -66, 5407171)
	spawnMobile("rori", "borgle_protector", 900,  -32.4, -70.5, -106.6, -51, 5407171)
	spawnMobile("rori", "borgle_protector", 900,  -36.2, -70.3, -111.3, -77, 5407171)

	spawnMobile("rori", "blood_thirsty_borgle", 900,  -30.1, -79.7, -138.5, 15, 5407172)
	spawnMobile("rori", "borgle_protector", 900,  -29.2, -79.8, -140.5, 41, 5407172)
	spawnMobile("rori", "borgle_protector", 900,  -33.9, -80.2, -139.6, 8, 5407172)

	spawnMobile("rori", "borgle_protector", 900,  -75.2, -99.2, -156.1, 24, 5407170)
	spawnMobile("rori", "borgle_protector", 900,  -73.6, -99.1, -158.4, 31, 5407170)
	spawnMobile("rori", "borgle_protector", 900,  -77.9, -99.4, -157.9, -29, 5407170)

	spawnMobile("rori", "borgle_matriarch", 900,  -91.4, -101.0, -106.0, 175, 5407173)
	spawnMobile("rori", "borgle_protector", 900,  -88.5, -100.9, -103.3, 178, 5407173)
	spawnMobile("rori", "borgle_protector", 900,  -94.6, -100.9, -103.8, 167, 5407173)
end
