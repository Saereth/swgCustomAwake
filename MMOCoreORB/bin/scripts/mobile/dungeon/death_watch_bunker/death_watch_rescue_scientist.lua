death_watch_rescue_scientist = Creature:new {
	objectName = "@mob/creature_names:death_watch_scientist",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 2000, --SWG Awakening Custom -- Max Damage
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 50000, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/warren_research_scientist.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "deathWatchRescueScientistConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(death_watch_rescue_scientist, "death_watch_rescue_scientist")
