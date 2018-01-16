singing_mountain_clan_councilwoman = Creature:new {
	objectName = "@mob/creature_names:singing_mtn_clan_councilwoman",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "mtn_clan",
	faction = "mtn_clan",
	level = 300, --SWG Awakening Custom -- Level
	chanceHit = 25, --SWG Awakening Custom -- Chance Hit
	damageMin = 1700, --SWG Awakening Custom -- Min Damage
	damageMax = 3200, --SWG Awakening Custom -- Max Damage
	baseXp = 29180, --SWG Awakening Custom -- Base Xp
	baseHAM = 400000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 600000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {100,35,35,100,100,100,100,100,-1},
	resists = {190,180,180,195,195,195,195,195,40}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/dressed_dathomir_sing_mt_clan_councilwoman.iff"},
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "awakening_eliteloot", chance = 100000},
				{group = "crystals_premium", chance = 1000000},
				{group = "armor_attachments", chance = 1900000},
				{group = "clothing_attachments", chance = 2000000},
				{group = "melee_weapons", chance = 4000000},
				{group = "wearables_scarce", chance = 100000},
				{group = "wearables_uncommon", chance = 900000}
			}
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(pikemanmaster,brawlermaster,tkamaster,forcepowermaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(singing_mountain_clan_councilwoman, "singing_mountain_clan_councilwoman")
