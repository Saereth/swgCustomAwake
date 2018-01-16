enraged_dune_kimogila = Creature:new {
	objectName = "@mob/creature_names:enraged_dune_kimogila",
	socialGroup = "kimogila",
	faction = "",
	level = 148,
	chanceHit = 6.25,
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 3500, --SWG Awakening Custom -- Max Damage
	baseXp = 14030,
	baseHAM = 150000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 200000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	resists = {180,190,180,200,180,180,200,180,-1},
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
	scale = 1.05,
	lootGroups = {
	 {
	        groups = {
				{group = "kimogila_common", chance = 10000000}
			},
			lootChance = 3960000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"dizzyattack","dizzyChance=70"},
		{"blindattack","blindChance=50"},
		{"posturedownattack","postureDownChance=70"},
		{"creatureareaattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(enraged_dune_kimogila, "enraged_dune_kimogila")
