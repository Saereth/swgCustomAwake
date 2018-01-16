rancor = Creature:new {
	objectName = "@mob/creature_names:rancor",
	socialGroup = "rancor",
	faction = "",
	level = 50,
	chanceHit = 2, --SWG Awakening Custom -- Chance Hit
	damageMin = 500, --SWG Awakening Custom -- Min Damage
	damageMax = 750, --SWG Awakening Custom -- Max Damage
	baseXp = 4916,
	baseHAM = 10000,
	baseHAMmax = 15000, --SWG Awakening Custom -- Base Ham Max
	armor = 1,
	--resists = {130,130,-1,160,160,160,-1,-1,-1},
	resists = {150,160,150,160,160,160,40,40,20}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 950,
	hideType = "hide_leathery",
	hideAmount = 877,
	boneType = "bone_mammal",
	boneAmount = 777,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 20, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/rancor.iff"},
	controlDeviceTemplate = "object/intangible/pet/rancor_hue.iff",
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 2000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""},
		{"intimidationattack",""},
		--SWG Awakening Custom -- Attacks
		{"posturedownattack",""},
		{"dizzyattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(rancor, "rancor")
