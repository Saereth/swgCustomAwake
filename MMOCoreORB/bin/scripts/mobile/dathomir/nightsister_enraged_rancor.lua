nightsister_enraged_rancor = Creature:new {
	objectName = "@mob/creature_names:nightsister_enraged_rancor",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 80,
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 570,
	damageMax = 1100, --SWG Awakening Custom -- Max Damage
	baseXp = 7668,
	baseHAM = 13000,
	baseHAMmax = 16000,
	armor = 1,
	--resists = {30,160,30,200,200,200,30,30,-1},
	resists = {40,90,40,95,95,95,30,30,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 950,
	hideType = "hide_leathery",
	hideAmount = 878,
	boneType = "bone_mammal",
	boneAmount = 778,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/rancor.iff"},
	scale = 1.15,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 2600000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"creatureareaattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(nightsister_enraged_rancor, "nightsister_enraged_rancor")
