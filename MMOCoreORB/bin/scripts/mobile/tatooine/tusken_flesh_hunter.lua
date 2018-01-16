tusken_flesh_hunter = Creature:new {
	objectName = "@mob/creature_names:tusken_flesh_hunter",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 31,
	chanceHit = 0.7, --SWG Awakening Custom -- Chance Hit
	damageMin = 500, --SWG Awakening Custom -- Min Damage
	damageMax = 700, --SWG Awakening Custom -- Max Damage
	baseXp = 3188,
	baseHAM = 9000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 15300, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	--resists = {0,0,0,0,0,0,0,0,-1},
	resists = {20,20,20,20,20,20,20,20,-1}, --SWG Awakening Custom -- Resists
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
				{group = "tusken_common", chance = 3000000},
				{group = "wearables_common", chance = 2000000},
				{group = "bone_armor", chance = 750000},
				{group = "chitin_armor", chance = 750000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "color_crystals", chance = 500000},
				{group = "crystals_poor", chance = 500000}
			}
		}
	},
	weapons = {"tusken_weapons"},
	conversationTemplate = "",
	attacks = merge(marksmanmaster,brawlermaster,fencermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(tusken_flesh_hunter, "tusken_flesh_hunter")
