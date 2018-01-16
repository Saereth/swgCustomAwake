death_watch_overlord_mines = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_dthwatch_gold",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 250, --SWG Awakening Custom -- Level
	chanceHit = 30, --SWG Awakening Custom -- Chance Hit
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 3000, --SWG Awakening Custom -- Max Damage
	baseXp = 20948,
	baseHAM = 350000,
	baseHAMmax = 450000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {80,80,90,80,45,45,100,70,-1},
	resists = {80,80,90,80,65,85,100,70,50}, --SWG Awakening Custom -- Resists
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
	scale = 1.25, --SWG Awakening Custom -- Scale

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_overlord_shared", chance =  10000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,riflemanmaster,fencermaster,brawlermaster,tkamaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(death_watch_overlord_mines, "death_watch_overlord_mines")
