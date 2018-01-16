enraged_bull_rancor = Creature:new {
	objectName = "@mob/creature_names:enraged_bull_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 95, --SWG Awakening Custom -- Level
	chanceHit = 6, --SWG Awakening Custom -- Chance Hit
	damageMin = 1000, --SWG Awakening Custom -- Min Damage
	damageMax = 1500, --SWG Awakening Custom -- Max Damage
	baseXp = 8500,
	baseHAM = 13000,
	baseHAMmax = 25000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {40,170,40,200,200,200,40,40,-1},
	resists = {140,170,160,200,200,200,140,140,25}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000, --SWG Awakening Custom -- Meat Amount
	hideType = "hide_leathery",
	hideAmount = 920, --SWG Awakening Custom -- Hide Amount
	boneType = "bone_mammal",
	boneAmount = 870, --SWG Awakening Custom -- Bone Amount
	milk = 0,
	tamingChance = 0,
	ferocity = 30, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bull_rancor.iff"},
	scale = 1.2,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 2780000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareaknockdown",""},
		{"creatureareadisease",""},
		{"dizzyattack",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(enraged_bull_rancor, "enraged_bull_rancor")
