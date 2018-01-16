nightsister_elder = Creature:new {
	objectName = "@mob/creature_names:nightsister_elder",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 278,
	chanceHit = 50, --SWG Awakening Custom -- Chance Hit
	damageMin = 1500, --SWG Awakening Custom -- Min Damage
	damageMax = 2500, --SWG Awakening Custom -- Max Damage
	baseXp = 26654,
	baseHAM = 350000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 400000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {200,25,25,200,200,200,200,200,-1},
	resists = {80,75,75,90,90,90,90,90,25}, --SWG Awakening Custom -- Resists
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_elder.iff"},
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "crystals_premium", chance = 500000},
				{group = "crystals_quality", chance = 1000000},
				{group = "nightsister_rare", chance = 500000},
				{group = "nightsister_common", chance = 2000000},
				{group = "armor_attachments", chance = 1000000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "melee_weapons", chance = 2500000},
				{group = "wearables_scarce", chance = 500000},
				{group = "wearables_uncommon", chance = 1000000}
			}
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,swordsmanmaster,fencermaster,pikemanmaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(nightsister_elder, "nightsister_elder")
