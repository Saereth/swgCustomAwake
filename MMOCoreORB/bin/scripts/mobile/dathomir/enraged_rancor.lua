enraged_rancor = Creature:new {
	objectName = "@mob/creature_names:enraged_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 80,
	chanceHit = 4, --SWG Awakening Custom -- Chance Hit
	damageMin = 700, --SWG Awakening Custom -- Min Damage
	damageMax = 1150, --SWG Awakening Custom -- Max Damage
	baseXp = 7668,
	baseHAM = 12000,
	baseHAMmax = 20000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {30,160,30,200,200,200,30,30,-1},
	resists = {60,160,70,200,200,200,50,50,10}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 950,
	hideType = "hide_leathery",
	hideAmount = 878,
	boneType = "bone_mammal",
	boneAmount = 778,
	milk = 0,
	tamingChance = 0,
	ferocity = 12,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/rancor_hue.iff"},
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

CreatureTemplates:addCreatureTemplate(enraged_rancor, "enraged_rancor")
