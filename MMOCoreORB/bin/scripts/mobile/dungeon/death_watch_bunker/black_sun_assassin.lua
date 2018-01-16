black_sun_assassin = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_blksun_assassin",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 110, --SWG Awakening Custom -- Level
	chanceHit = 10, --SWG Awakening Custom -- Chance Hit
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 2500, --SWG Awakening Custom -- Max Damage
	baseXp = 10081,
	baseHAM = 30000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 40000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {55,55,70,45,75,80,55,45,-1},
	resists = {55,55,70,45,75,40,55,45,25}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/dressed_black_sun_assassin.iff"},
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

CreatureTemplates:addCreatureTemplate(black_sun_assassin, "black_sun_assassin")
