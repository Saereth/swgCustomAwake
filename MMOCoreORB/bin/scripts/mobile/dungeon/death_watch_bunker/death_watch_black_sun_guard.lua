death_watch_black_sun_guard = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_blksun_guard",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 100, --SWG Awakening Custom -- Level
	chanceHit = 10, --SWG Awakening Custom -- Chance Hit
	damageMin = 1000, --SWG Awakening Custom -- Min Damage
	damageMax = 2000, --SWG Awakening Custom -- Max Damage
	baseXp = 9057,
	baseHAM = 22000,
	baseHAMmax = 25000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {40,40,60,35,55,70,35,40,-1},
	resists = {40,40,60,35,55,40,35,40,20}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/dressed_black_sun_guard.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 10000000}
			},
			lootChance = 1000000
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,brawlermaster,tkamaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(death_watch_black_sun_guard, "death_watch_black_sun_guard")
