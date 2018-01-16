tusken_executioner = Creature:new {
	objectName = "@mob/creature_names:tusken_executioner",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	level = 275, --SWG Awakening Custom -- Level
	chanceHit = 50, --SWG Awakening Custom -- Hit Chance
	damageMin = 2500, --SWG Awakening Custom -- Min Damage
	damageMax = 4000, --SWG Awakening Custom -- Max Damage
	baseXp = 30040, --SWG Awakening Custom -- Base Xp
	baseHAM = 350000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 450000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {85,80,35,100,20,30,45,80,-1},
	resists = {185,185,185,190,180,180,75,80,-1}, --SWG Awakening Custom -- Resists
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
	attacks = merge(marksmanmaster,brawlermaster,tkamaster,fencermaster,riflemanmaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(tusken_executioner, "tusken_executioner")
