krayt_dragon_ancient = Creature:new {
	objectName = "@mob/creature_names:krayt_dragon_ancient",
	socialGroup = "krayt",
	faction = "",
	level = 350, --SWG Awakening Custom -- Level
	chanceHit = 75, --SWG Awakening Custom -- Chance Hit
	damageMin = 7500, --SWG Awakening Custom -- Min Damage
	damageMax = 9000, --SWG Awakening Custom -- Max Damage
	baseXp = 35549, --SWG Awakening Custom -- Base Xp
	baseHAM = 650000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 800000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {195,195,195,195,165,195,195,195,-1},
	resists = {195,195,195,195,195,195,195,195,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 950,
	boneType = "bone_mammal",
	boneAmount = 905,
	milk = 0,
	tamingChance = 0,
	ferocity = 50, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 1.5,

	templates = {"object/mobile/krayt_dragon.iff"},

	lootGroups = {
		{
	        groups = {
				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 1500000},
				{group = "krayt_tissue_rare", chance = 2400000},
				{group = "pearls_premium", chance = 2600000},
				{group = "pearls_flawless", chance = 1000000},
				{group = "awakening_armor_rare", chance = 1250000},
				{group = "awakening_weapons_rare", chance = 1250000}
			},
			lootChance = 10000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"dizzyattack","stateAccuracyBonus=100"},
		{"blindattack","stateAccuracyBonus=100"},
		{"intimidationattack","stateAccuracyBonus=100"},
		{"posturedownattack","stateAccuracyBonus=100"},
		{"creatureareaknockdown","stateAccuracyBonus=100"},
		{"stunattack","stateAccuracyBonus=100"}
	}
}

CreatureTemplates:addCreatureTemplate(krayt_dragon_ancient, "krayt_dragon_ancient")
