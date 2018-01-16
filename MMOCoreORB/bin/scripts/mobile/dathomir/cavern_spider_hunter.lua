cavern_spider_hunter = Creature:new {
	objectName = "@mob/creature_names:gaping_spider_hunter",
	socialGroup = "spider",
	faction = "",
	level = 46,
	chanceHit = 0.75, --SWG Awakening Custom -- Chance Hit
	damageMin = 400, --SWG Awakening Custom -- Min Damage
	damageMax = 750, --SWG Awakening Custom -- Max Damage
	baseXp = 4552,
	baseHAM = 9500,
	baseHAMmax = 12000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {140,140,160,115,-1,-1,0,-1,-1},
	resists = {90,90,90,90,25,25,25,25,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 35,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 9,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider_hue.iff"},
	scale = 1.15,
	lootGroups = {},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""},
		{"mediumpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(cavern_spider_hunter, "cavern_spider_hunter")
