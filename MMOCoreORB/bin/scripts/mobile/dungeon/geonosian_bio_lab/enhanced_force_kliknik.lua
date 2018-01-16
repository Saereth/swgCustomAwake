enhanced_force_kliknik = Creature:new {
	objectName = "",
	customName = "Force Kliknik",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 94,
	chanceHit = 10, --SWG Awakening Custom -- Hit Chance
	damageMin = 2000, --SWG Awakening Custom -- Min Damage
	damageMax = 3000, --SWG Awakening Custom -- Max Damage
	baseXp = 8964,
	baseHAM = 30000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 35000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {35,35,0,95,-1,0,0,0,-1},
	resists = {165,165,165,195,155,155,155,155,20}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 45,
	hideType = "hide_scaley",
	hideAmount = 40,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/kliknik_hue.iff"},
	scale = 1.45,
	lootGroups = {
	 {
	        groups = {
				{group = "geo_kliknik", chance = 10000000}
			},
			lootChance = 2880000
		}
	},
	weapons = {"creature_spit_heavy_flame"},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareaattack",""},
		{"stunattack","stunChance=70"},
		{"dizzyattack","dizzyChance=75"},
		{"posturedownattack","postureDownChance=75"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_force_kliknik, "enhanced_force_kliknik")