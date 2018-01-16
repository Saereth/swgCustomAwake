kiin_dray = Creature:new {
	objectName = "@mob/creature_names:gaping_spider_recluse_giant_kiin_dray",
	socialGroup = "spider_nightsister",
	faction = "spider_nightsister",
	level = 226, --SWG Awakening Custom -- Level
	chanceHit = 20, --SWG Awakening Custom -- Chance Hit
	damageMin = 1830, --SWG Awakening Custom -- Min Damage
	damageMax = 3070, --SWG Awakening Custom -- Max Damage
	baseXp = 21953, --SWG Awakening Custom -- Base Xp
	baseHAM = 200000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 250000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {155,155,135,130,130,130,15,130,-1},
	resists = {180,185,185,185,185,185,185,185,50}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 11,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 30, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider_recluse_giant_kiin_dray.iff"},
	scale = 5.0,  --SWG Awakening Custom -- Scale
	lootGroups = {
		{
			groups = {
 				--SWG Awakening Custom -- Loot
				{group = "awakening_eliteloot", chance = 100000},
				{group = "wearables_scarce", chance = 900000},
				{group = "clothing_attachments", chance = 3000000},
				{group = "armor_all", chance = 3000000},
				{group = "weapons_all", chance = 3000000}
			},
			lootChance = 7500000
		}
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"creatureareapoison",""},
		{"strongpoison",""},
		--SWG Awakening Custom -- Attacks
		{"intimidationattack",""},
		{"creatureareadisease",""},
		{"posturedownattack",""},
		{"dizzyattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(kiin_dray, "kiin_dray")
