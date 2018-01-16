canyon_krayt_dragon = Creature:new {
	objectName = "@mob/creature_names:canyon_krayt_dragon",
	socialGroup = "krayt",
	faction = "",
	level = 300, --SWG Awakening Custom -- Level
	chanceHit = 30, --SWG Awakening Custom -- Chance Hit
	damageMin = 2500, --SWG Awakening Custom -- Min Damage
	damageMax = 4500, --SWG Awakening Custom -- Max Damage
	baseXp = 27549, --SWG Awakening Custom -- Base Xp
	baseHAM = 300000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 400000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {160,160,160,160,120,160,160,160,-1},
	resists = {170,170,170,170,170,170,170,170,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 750,
	boneType = "bone_mammal",
	boneAmount = 705, --SWG Awakening Custom -- Bone Count
	milk = 0,
	tamingChance = 0,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/canyon_krayt_dragon.iff"},
	scale = 0.9;
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 2500000},
				{group = "krayt_tissue_uncommon", chance = 1400000},
				{group = "pearls_select", chance = 1400000},
				{group = "pearls_premium", chance = 100000},
				{group = "armor_all", chance = 1400000},
				{group = "weapons_all", chance = 1400000},
				{group = "wearables_all", chance = 1300000}
			},
			lootChance = 7500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareacombo","stateAccuracyBonus=55"},
		{"dizzyattack","stateAccuracyBonus=55"},
		{"blindattack","stateAccuracyBonus=55"},
		{"intimidationattack","stateAccuracyBonus=55"},
		{"posturedownattack","stateAccuracyBonus=55"},
		{"creatureareaknockdown","stateAccuracyBonus=55"},
		{"stunattack","stateAccuracyBonus=55"}
	}
}

CreatureTemplates:addCreatureTemplate(canyon_krayt_dragon, "canyon_krayt_dragon")
