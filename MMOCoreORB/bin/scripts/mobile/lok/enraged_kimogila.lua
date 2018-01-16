enraged_kimogila = Creature:new {
	objectName = "@mob/creature_names:enraged_kimogila",
	socialGroup = "kimogila",
	faction = "",
	level = 135,
	chanceHit = 4.75,
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 2500, --SWG Awakening Custom -- Max Damage
	baseXp = 12801,
	baseHAM = 75000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 125000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	resists = {145,170,145,170,145,140,200,145,-1},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 1000,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/kimogila_hue.iff"},
	scale = 0.9,
	lootGroups = {
	 {
	        groups = {
				{group = "kimogila_common", chance = 10000000}
			},
			lootChance = 3700000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
 		--SWG Awakening Custom -- Attacks
		{"dizzyattack","dizzyChance=50"},
		{"blindattack","blindChance=50"},
		{"posturedownattack","postureDownChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(enraged_kimogila, "enraged_kimogila")
