enhanced_kliknik = Creature:new {
	objectName = "@mob/creature_names:geonosian_kliknik_force_strong",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 109,
	chanceHit = 10, --SWG Awakening Custom -- Chance Hit
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 3000, --SWG Awakening Custom -- Max Damage
	baseXp = 10360,
	baseHAM = 34000,
	baseHAMmax = 42000,
	armor = 2,
	--resists = {40,40,10,195,-1,110,110,10,-1},
	resists = {140,140,140,195,145,150,150,140,-1}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/kliknik.iff"},
	scale = 1.4,
	lootGroups = {
	 {
	        groups = {
				{group = "geo_kliknik", chance = 10000000}
			},
			lootChance = 3180000
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

CreatureTemplates:addCreatureTemplate(enhanced_kliknik, "enhanced_kliknik")
