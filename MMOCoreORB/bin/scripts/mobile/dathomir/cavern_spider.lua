cavern_spider = Creature:new {
	objectName = "@mob/creature_names:cave_gaping_spider",
	socialGroup = "spider",
	faction = "",
	level = 27,
	chanceHit = 0.50, --SWG Awakening Custom -- Chance Hit
	damageMin = 250,
	damageMax = 500, --SWG Awakening Custom -- Damage Max
	baseXp = 2822,
	baseHAM = 7700,
	baseHAMmax = 10000, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	--resists = {130,130,15,-1,15,15,-1,-1,-1},
	resists = {90,90,50,50,50,50,-1,-1,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 35,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider.iff"},
	scale = 1.1,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
 		--SWG Awakening Custom -- Attacks
		{"intimidationattack","intimidationChance=50"},
		{"mediumpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(cavern_spider, "cavern_spider")
