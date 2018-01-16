mand_bunker_foreman = Creature:new {
	objectName = "",
	customName = "Japer Witter (a mine Foreman)",
	socialGroup = "death_watch",
	faction = "",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 2000, --SWG Awakening Custom -- Max Damage
	baseXp = 9336,
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
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_mand_bunker_foreman.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "deathWatchForemanConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(mand_bunker_foreman, "mand_bunker_foreman")
