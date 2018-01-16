crazed_geonosian_guard = Creature:new {
	objectName = "@mob/creature_names:geonosian_crazed_guard",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "self",
	faction = "",
	level = 70, --SWG Awakening Custom -- Level
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 800, --SWG Awakening Custom -- Min Damage
	damageMax = 1200, --SWG Awakening Custom -- Max Damage
	baseXp = 9000, --SWG Awakening Custom -- Base Xp
	baseHAM = 12000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 15000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {125,135,-1,165,25,125,-1,25,-1},
	resists = {140,150,150,165,150,135,150,125,-1}, --SWG Awakening Custom -- Resists
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
		"object/mobile/dressed_geonosian_warrior_01.iff",
		"object/mobile/dressed_geonosian_warrior_02.iff",
		"object/mobile/dressed_geonosian_warrior_03.iff"},
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot Chance
				{group = "geonosian_common", chance = 6000000},
				{group = "geonosian_relic", chance = 4000000}
			},
			lootChance = 5000000
		}
	},
	weapons = {"geonosian_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,marksmanmaster,pistoleermid,fencermid) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(crazed_geonosian_guard, "crazed_geonosian_guard")
