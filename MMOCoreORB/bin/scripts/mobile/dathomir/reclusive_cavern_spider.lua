reclusive_cavern_spider = Creature:new {
	objectName = "@mob/creature_names:cave_gaping_spider_recluse",
	socialGroup = "spider",
	faction = "",
	level = 46,
	chanceHit = 0.46,
	damageMin = 1000, --SWG Awakening Custom -- Min Damage
	damageMax = 2000, --SWG Awakening Custom -- Max Damage
	baseXp = 4552,
	baseHAM = 15000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 20000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {140,140,160,125,-1,-1,0,-1,-1},
	resists = {100,100,100,100,-1,-1,0,-1,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 41,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 8,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider_recluse.iff"},
	scale = 1.25,
	lootGroups = {},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"creatureareaattack",""},
		{"strongpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(reclusive_cavern_spider, "reclusive_cavern_spider")
