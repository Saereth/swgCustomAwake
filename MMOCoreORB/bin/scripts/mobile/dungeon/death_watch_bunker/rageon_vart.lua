rageon_vart = Creature:new {
	objectName = "",
	customName = "Rageon Vart",
	socialGroup = "death_watch",
	faction = "",
	level = 195, --SWG Awakening Custom -- Level
	chanceHit = 15, --SWG Awakening Custom -- Chance Hit
	damageMin = 1520, --SWG Awakening Custom -- Min Damage
	damageMax = 2050, --SWG Awakening Custom -- Max Damage
	baseXp = 16794,
	baseHAM = 165000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 175000,
	armor = 2,
	--resists = {75,75,90,80,45,45,100,70,-1},
	resists = {75,75,90,80,45,45,100,70,20}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,
	
	templates = {"object/mobile/dressed_death_watch_grey.iff"},
	lootGroups = {
		{
			groups = {
				{group = "rageon_vart_drop", chance = 10000000}
			},
			lootChance = 10000000
		} 
	},
	weapons = {"death_watch_commander_weapons"},
	conversationTemplate = "",
	attacks = merge(carbineermaster,bountyhuntermaster,brawlermaster,tkamaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(rageon_vart, "rageon_vart")
