bull_rancor = Creature:new {
	objectName = "@mob/creature_names:bull_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 70, --SWG Awakening Custom -- Level
	chanceHit = 5, --SWG Awakening Custom -- Chance Hit
	damageMin = 600, --SWG Awakening Custom -- Min Damage
	damageMax = 1200, --SWG Awakening Custom -- Max Damage
	baseXp = 7500, --SWG Awakening Custom -- Base Xp
	baseHAM = 11000,
	baseHAMmax = 20000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {135,160,15,180,180,180,15,15,-1},
	resists = {160,160,160,180,180,180,155,155,25}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 900,
	boneType = "bone_mammal",
	boneAmount = 850,
	milk = 0,
	tamingChance = 0.01,
	ferocity = 20, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bull_rancor.iff"},
	controlDeviceTemplate = "object/intangible/pet/rancor_hue.iff",
	scale = 1.1,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 2300000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareadisease",""},
		{"dizzyattack",""},
 		--SWG Awakening Custom -- Attacks
		{"posturedownattack",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(bull_rancor, "bull_rancor")
