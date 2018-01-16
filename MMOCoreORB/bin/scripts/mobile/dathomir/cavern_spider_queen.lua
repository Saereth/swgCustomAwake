cavern_spider_queen = Creature:new {
	objectName = "@mob/creature_names:gaping_spider_queen",
	socialGroup = "spider",
	faction = "",
	level = 46,
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 500, --SWG Awakening Custom -- Min Damage
	damageMax = 1000, --SWG Awakening Custom -- Max Damage
	baseXp = 4552,
	baseHAM = 10000,
	baseHAMmax = 12000,
	armor = 0,
	--resists = {160,160,140,125,30,-1,30,30,-1},
	resists = {90,90,90,90,30,25,30,30,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 40,
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

	templates = {"object/mobile/gaping_spider_queen.iff"},
	scale = 1.3,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"mediumpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(cavern_spider_queen, "cavern_spider_queen")
