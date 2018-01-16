tusken_guard = Creature:new {
	objectName = "@mob/creature_names:tusken_guard",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 26,
	chanceHit = 0.5, --SWG Awakening Custom -- Chance Hit
	damageMin = 300, --SWG Awakening Custom -- Min Damage
	damageMax = 500, --SWG Awakening Custom -- Max Damage
	baseXp = 2730,
	baseHAM = 7200,
	baseHAMmax = 10000, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	--resists = {20,20,0,50,-1,50,-1,-1,-1},
	resists = {20,30,30,50,40,50,30,30,-1}, --SWG Awakening Custom -- Resists
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
	attacks = merge(marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(tusken_guard, "tusken_guard")
