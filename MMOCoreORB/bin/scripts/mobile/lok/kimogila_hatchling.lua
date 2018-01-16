kimogila_hatchling = Creature:new {
	objectName = "@mob/creature_names:kimogila_hatchling",
	socialGroup = "kimogila",
	faction = "",
	level = 22,
	chanceHit = 0.50, --SWG Awakening Custom -- Chance Hit
	damageMin = 250, --SWG Awakening Custom -- Min Damage
	damageMax = 500, --SWG Awakening Custom -- Max Damage
	baseXp = 2006,
	baseHAM = 5000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 15000, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	resists = {10,10,10,155,10,10,200,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 700,
	hideType = "hide_leathery",
	hideAmount = 625,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/kimogila_hatchling.iff"},
	scale = 0.5,
	lootGroups = {
	 {
	        groups = {
				{group = "kimogila_common", chance = 10000000}
			},
			lootChance = 1440000
		}
	},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"dizzyattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(kimogila_hatchling, "kimogila_hatchling")
