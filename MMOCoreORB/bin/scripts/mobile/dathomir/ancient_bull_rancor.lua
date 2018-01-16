ancient_bull_rancor = Creature:new {
	objectName = "@mob/creature_names:ancient_bull_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 98,
	chanceHit = 10, --SWG Awakening Custom -- Chance Hit
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 2000, --SWG Awakening Custom -- Max Damage
	baseXp = 10336, --SWG Awakening Custom -- Base Xp
	baseHAM = 20000,
	baseHAMmax = 30000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {150,165,0,200,200,200,0,0,-1},
	resists = {190,190,170,190,190,190,150,150,25}, --SWG Awakening Custom -- Resists
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 1000,
	boneType = "bone_mammal",
	boneAmount = 950,
	milk = 0,
	tamingChance = 0,
	ferocity = 40, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bull_rancor.iff"},
	scale = 1.3, --SWG Awakening Custom -- Scale
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 2960000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding",""},
		{"creatureareacombo",""},
 		--SWG Awakening Custom -- Attacks
		{"creatureareaknockdown",""},
		{"creatureareadisease",""},
		{"dizzyattack",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(ancient_bull_rancor, "ancient_bull_rancor")
