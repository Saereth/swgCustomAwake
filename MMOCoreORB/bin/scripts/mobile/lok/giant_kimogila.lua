giant_kimogila = Creature:new {
	objectName = "@mob/creature_names:giant_kimogila",
	socialGroup = "kimogila",
	faction = "",
	level = 139,
	chanceHit = 5.5,
	damageMin = 875,
	damageMax = 1460,
	baseXp = 13178,
	baseHAM = 100000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 150000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {135,180,20,180,20,20,200,20,-1},
	resists = {155,180,80,180,80,80,200,80,-1}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/giant_kimogila.iff"},
	scale = 1.15,
	lootGroups = {
	    {
	        groups = {
				{group = "kimogila_common", chance = 10000000}
			},
			lootChance = 3780000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
 		--SWG Awakening Custom -- Attacks
		{"dizzyattack","dizzyChance=50"},
		{"blindattack","blindChance=50"},
		{"creatureareaknockdown","knockdownChance=50"},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(giant_kimogila, "giant_kimogila")
