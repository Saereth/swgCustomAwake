giant_cavern_spider_recluse = Creature:new {
	objectName = "@mob/creature_names:gaping_spider_recluse_giant",
	socialGroup = "spider",
	faction = "",
	level = 116,
	chanceHit = 3.1,
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 2500, --SWG Awakening Custom -- Max Damage
	baseXp = 11015,
	baseHAM = 33500,
	baseHAMmax = 40000, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	--resists = {160,160,160,0,0,0,0,0,-1},
	resists = {140,140,160,125,-1,-1,0,-1,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_insect",
	meatAmount = 80,
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

	templates = {"object/mobile/gaping_spider_recluse.iff"},
	scale = 2.0,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"strongpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(giant_cavern_spider_recluse, "giant_cavern_spider_recluse")
