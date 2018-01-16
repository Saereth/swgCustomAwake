enhanced_gaping_spider = Creature:new {
	objectName = "@mob/creature_names:geonosian_gaping_spider_fire",
	customName = "Fire Breathing Spider",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 150, --SWG Awakening Custom -- Level
	chanceHit = 5, --SWG Awakening Custom -- Chance Hit
	damageMin = 5000, --SWG Awakening Custom -- Min Damage
	damageMax = 8000, --SWG Awakening Custom -- Max Damage
	baseXp = 15267, --SWG Awakening Custom -- Base Xp
	baseHAM = 50000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 75000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {150,10,-1,195,-1,10,10,10,-1},
	resists = {180,180,180,185,180,150,150,150,20}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 50,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider.iff"},
	scale = 2.5,
	lootGroups = {
		{
			groups = {
				{group = "fire_breathing_spider", chance = 10000000}
			}
		}
	},
	weapons = {"creature_spit_heavy_flame"},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"strongpoison",""},
		{"blindattack","blindChance=70"},
		{"dizzyattack","dizzyChance=70"},
		{"posturedownattack","postureDownChance=70"},
		{"intimidationattack","intimidationChance=70"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_gaping_spider, "enhanced_gaping_spider")
