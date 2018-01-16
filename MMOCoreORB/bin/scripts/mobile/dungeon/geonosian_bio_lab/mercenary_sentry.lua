mercenary_sentry = Creature:new {
	objectName = "@mob/creature_names:geonosian_human_security_force",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "geonosian",
	faction = "",
	level = 70, --SWG Awakening Custom -- Level
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 1000, --SWG Awakening Custom -- Min Damage
	damageMax = 1250, --SWG Awakening Custom -- Max Damage
	baseXp = 6380,
	baseHAM = 12000,
	baseHAMmax = 14000,
	armor = 1,
	--resists = {40,40,20,20,20,20,20,-1,-1},
	resists = {50,50,50,35,50,30,30,35,-1}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
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
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_noble_human_male_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "geonosian_hard", chance = 1000000},
				{group = "geonosian_common", chance = 4500000},
				{group = "geonosian_relic", chance = 4500000}
			}
		}
	},
	weapons = {"geonosian_mercenary_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,marksmanmaster,pistoleermaster,riflemanmaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(mercenary_sentry, "mercenary_sentry")
