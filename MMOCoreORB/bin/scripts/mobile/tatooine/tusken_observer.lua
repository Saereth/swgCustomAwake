tusken_observer = Creature:new {
	objectName = "@mob/creature_names:tusken_observer",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 250, --SWG Awakening Custom -- Level
	chanceHit = 25, --SWG Awakening Custom -- Chance Hit
	damageMin = 1270,
	damageMax = 3550, --SWG Awakening Custom -- Damage Max
	baseXp = 25040, --SWG Awakening Custom -- Base Xp
	baseHAM = 350000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 400000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {185,185,135,200,10,130,145,180,-1},
	resists = {185,185,175,200,175,170,165,180,-1}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ENEMY + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/tusken_raider.iff"},

	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "tusken_common", chance = 2500000},
				{group = "wearables_scarce", chance = 1500000},
				{group = "bone_armor", chance = 1000000},
				{group = "chitin_armor", chance = 1000000},
				{group = "armor_attachments", chance = 1500000},
				{group = "clothing_attachments", chance = 1500000},
				{group = "color_crystals", chance = 500000},
				{group = "crystals_premium", chance = 500000}
			}
		}
	},
	weapons = {"tusken_weapons"},
	conversationTemplate = "",
	--attacks = merge(marksmanmaster,brawlermaster,fencermaster,riflemanmaster)
	attacks = merge(marksmanmaster,brawlermaster,tkamaster,fencermaster,riflemanmaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(tusken_observer, "tusken_observer")
