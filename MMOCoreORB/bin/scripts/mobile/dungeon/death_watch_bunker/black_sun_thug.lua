black_sun_thug = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_blksun_thug",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 90, --SWG Awakening Custom -- Level
	chanceHit = 5,  --SWG Awakening Custom -- Chance Hit
	damageMin = 900, --SWG Awakening Custom -- Min Damage
	damageMax = 1500, --SWG Awakening Custom -- Max Damage
	baseXp = 8130,
	baseHAM = 15000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 16000,
	armor = 1,
	--resists = {40,40,60,35,55,70,35,40,-1},
	resists = {40,40,60,35,55,35,35,40,15}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/dressed_black_sun_thug.iff"},
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "junk", chance = 6500000},
				{group = "pistols", chance = 750000},
				{group = "rifles", chance = 750000},
				{group = "carbines", chance = 750000},
				{group = "jetpack_parts", chance = 500000},				
				{group = "bounty_hunter_armor", chance = 700000},
				{group = "jetpack_base", chance = 50000},
				{group = "wearables_common", chance = 500000},
				{group = "wearables_uncommon", chance = 500000}
			}
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,brawlermaster,tkamaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(black_sun_thug, "black_sun_thug")
