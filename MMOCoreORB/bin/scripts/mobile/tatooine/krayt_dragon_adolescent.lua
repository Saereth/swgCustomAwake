krayt_dragon_adolescent = Creature:new {
	objectName = "@mob/creature_names:krayt_dragon_adolescent",
	socialGroup = "krayt",
	faction = "",
	level = 275, --SWG Awakening Custom -- Level
	chanceHit = 20, --SWG Awakening Custom -- Hit Chance
	damageMin = 2000, --SWG Awakening Custom -- Min Damage
	damageMax = 4000, --SWG Awakening Custom -- Max Damage
	baseXp = 27049, --SWG Awakening Custom -- Base Xp
	baseHAM = 200000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 300000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {195,195,195,195,165,195,195,195,-1},
	resists = {165,165,165,165,165,165,165,165,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 650, --SWG Awakening Custom -- Hide Amount
	boneType = "bone_mammal",
	boneAmount = 605, --SWG Awakening Custom -- Bone Amount
	milk = 0,
	tamingChance = 0,
	ferocity = 20, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/krayt_dragon_hue.iff"},
	scale = 0.7;

	lootGroups = {
		{
	        groups = {
				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 3000000},
				{group = "krayt_tissue_common", chance = 2500000},
				{group = "pearls_select", chance = 1500000},
				{group = "armor_all", chance = 1000000},
				{group = "weapons_all", chance = 1000000},
				{group = "wearables_all", chance = 1000000}
			},
			lootChance = 75000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareacombo","stateAccuracyBonus=50"},
		{"dizzyattack","stateAccuracyBonus=50"},
		{"blindattack","stateAccuracyBonus=50"},
		{"intimidationattack","stateAccuracyBonus=50"},
		{"posturedownattack","stateAccuracyBonus=50"},
		{"creatureareaknockdown","stateAccuracyBonus=50"},
		{"stunattack","stateAccuracyBonus=50"}
	}
}

CreatureTemplates:addCreatureTemplate(krayt_dragon_adolescent, "krayt_dragon_adolescent")
