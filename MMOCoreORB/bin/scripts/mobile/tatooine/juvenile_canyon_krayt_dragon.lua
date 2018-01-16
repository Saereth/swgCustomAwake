juvenile_canyon_krayt_dragon = Creature:new {
	objectName = "@mob/creature_names:juvenile_canyon_krayt",
	socialGroup = "krayt",
	faction = "",
	level = 122,
	chanceHit = 10, --SWG Awakening Custom -- Chance Hit
	damageMin = 800, --SWG Awakening Custom -- Min Damage
	damageMax = 1500, --SWG Awakening Custom -- Max Damage
	baseXp = 11577,
	baseHAM = 54000,
	baseHAMmax = 64000,
	armor = 2,
	--resists = {170,170,15,15,110,15,15,15,-1},
	resists = {140,140,140,140,140,140,140,140,-1}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 750,
	hideType = "hide_bristley",
	hideAmount = 500,
	boneType = "bone_mammal",
	boneAmount = 410,
	milk = 0,
	tamingChance = 0,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/juvenile_canyon_krayt.iff"},
	scale = 0.4; --SWG Awakening Custom -- Scale

	lootGroups = {
		{
	        groups = {
				--SWG Awakening Custom -- Loot
				{group = "krayt_dragon_common", chance = 4000000},
				{group = "krayt_tissue_common", chance = 2500000},
				{group = "pearls_select", chance = 500000},
				{group = "armor_all", chance = 1000000},
				{group = "weapons_all", chance = 1000000},
				{group = "wearables_all", chance = 1000000}
			},
			lootChance = 7000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"posturedownattack",""},
		{"creatureareaattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(juvenile_canyon_krayt_dragon, "juvenile_canyon_krayt_dragon")
