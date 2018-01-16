tusken_chief = Creature:new {
	objectName = "@mob/creature_names:tusken_chief",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 43,
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 800, --SWG Awakening Custom -- Min Damage
	damageMax = 1300, --SWG Awakening Custom -- Max Damage
	baseXp = 4279,
	baseHAM = 12500, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 17500, --SWG Awakening Custom -- Base Ham Max
	armor = 1, --SWG Awakening Custom -- Armor
	--resists = {45,30,30,60,-1,40,-1,-1,-1},
	resists = {45,40,30,60,40,40,40,40,-1}, --SWG Awakening Custom -- Resists
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
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/tusken_raider.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 1500000},
				{group = "tusken_common", chance = 3500000},
				{group = "wearables_common", chance = 1000000},
				{group = "wearables_uncommon", chance = 500000},
				{group = "bone_armor", chance = 750000},
				{group = "chitin_armor", chance = 750000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "color_crystals", chance = 500000},
				{group = "crystals_okay", chance = 500000}
			}
		}
	},
	weapons = {"tusken_weapons"},
	conversationTemplate = "",
	attacks = merge(marksmanmaster,brawlermaster,fencermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(tusken_chief, "tusken_chief")
