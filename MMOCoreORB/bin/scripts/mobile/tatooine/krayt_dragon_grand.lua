krayt_dragon_grand = Creature:new {
	objectName = "@mob/creature_names:krayt_dragon_grand",
	socialGroup = "krayt",
	faction = "",
	level = 320, --SWG Awakening Custom -- Level
	chanceHit = 40, --SWG Awakening Custom -- Chance Hit
	damageMin = 2500, --SWG Awakening Custom -- Min Damage
	damageMax = 4500, --SWG Awakening Custom -- Max Damage
	baseXp = 28049, --SWG Awakening Custom -- Base Xp
	baseHAM = 400000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 500000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {195,195,195,195,165,195,195,195,-1},
	resists = {175,175,175,175,175,175,175,175,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 850, --SWG Awakening Custom -- Hide Amount
	boneType = "bone_mammal",
	boneAmount = 805, --SWG Awakening Custom -- Bone Amount
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/krayt_dragon.iff"},
	scale = 1.0; --SWG Awakening Custom -- Scale

	lootGroups = {
		{
	        groups = {
 				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 2000000},
				{group = "krayt_tissue_uncommon", chance = 2300000},
				{group = "pearls_select", chance = 2200000},
				{group = "pearls_premium", chance = 500000},
				{group = "awakening_armor_rare", chance = 1500000},
				{group = "awakening_weapons_rare", chance = 1500000}
			},
			lootChance = 9000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"creatureareacombo","stateAccuracyBonus=70"},
		{"dizzyattack","stateAccuracyBonus=70"},
		{"blindattack","stateAccuracyBonus=70"},
		{"intimidationattack","stateAccuracyBonus=70"},
		{"posturedownattack","stateAccuracyBonus=70"},
		{"creatureareaknockdown","stateAccuracyBonus=70"},
		{"stunattack","stateAccuracyBonus=70"}
	}
}

CreatureTemplates:addCreatureTemplate(krayt_dragon_grand, "krayt_dragon_grand")
