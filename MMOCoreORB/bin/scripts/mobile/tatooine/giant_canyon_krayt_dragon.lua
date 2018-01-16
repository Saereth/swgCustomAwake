giant_canyon_krayt_dragon = Creature:new {
	objectName = "@mob/creature_names:giant_canyon_krayt_dragon",
	socialGroup = "krayt",
	faction = "",
	level = 330, --SWG Awakening Custom -- Level
	chanceHit = 50, --SWG Awakening Custom -- Chance Hit
	damageMin = 3000, --SWG Awakening Custom -- Min Damage
	damageMax = 5000, --SWG Awakening Custom -- Max Damage
	baseXp = 28549,
	baseHAM = 450000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 550000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {170,170,170,170,130,170,170,170,-1},
	resists = {180,180,180,180,180,180,180,180,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 900, --SWG Awakening Custom -- Hide Amount
	boneType = "bone_mammal",
	boneAmount = 855, --SWG Awakening Custom -- Bone Amount
	milk = 0,
	tamingChance = 0,
	ferocity = 35, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/canyon_krayt_dragon.iff"},
	scale = 1.2;

	lootGroups = {
		{
	        groups = {
				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 1750000},
				{group = "krayt_tissue_rare", chance = 2000000},
				{group = "pearls_select", chance = 2250000},
				{group = "pearls_premium", chance = 1000000},
				{group = "fhemu_armor_rare", chance = 1500000},
				{group = "fhemu_weapons_rare", chance = 1500000}
			},
			lootChance = 9500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareacombo","stateAccuracyBonus=80"},
		{"dizzyattack","stateAccuracyBonus=80"},
		{"blindattack","stateAccuracyBonus=80"},
		{"intimidationattack","stateAccuracyBonus=80"},
		{"posturedownattack","stateAccuracyBonus=80"},
		{"creatureareaknockdown","stateAccuracyBonus=80"},
		{"stunattack","stateAccuracyBonus=80"}
	}
}

CreatureTemplates:addCreatureTemplate(giant_canyon_krayt_dragon, "giant_canyon_krayt_dragon")
