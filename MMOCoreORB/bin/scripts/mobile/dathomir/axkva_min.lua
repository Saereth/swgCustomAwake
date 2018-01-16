axkva_min = Creature:new {
	objectName = "@mob/creature_names:axkva_min",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 325, --SWG Awakening Custom -- Level
	chanceHit = 75, --SWG Awakening Custom -- Chance Hit
	damageMin = 1750, --SWG Awakening Custom -- Min Damage
	damageMax = 3300, --SWG Awakening Custom -- Max Damage
	specialDamageMult = 7.5,
	baseXp = 33549, --SWG Awakening Custom -- Base Xp
	baseHAM = 500000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 750000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {100,35,35,100,100,100,100,100,-1},
	resists = {190,185,185,195,195,195,195,195,60}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/dressed_dathomir_nightsister_axkva.iff"},
	lootGroups = {
		{
			groups = {
				--SWG Awakening Custom -- Loot
				{group = "awakening_eliteloot", chance = 500000},
				{group = "nightsister_rare", chance = 750000},
				{group = "wearables_scarce", chance = 750000},
				{group = "crystals_premium", chance = 1000000},
				{group = "clothing_attachments", chance = 2000000},
				{group = "melee_weapons", chance = 2500000},
				{group = "nightsister_common", chance = 2500000}
			}
		},
		{
			groups = {
				{group = "axkva_min", chance = 10000000},
			},
			lootChance = 10000000 --SWG Awakening Custom -- Loot Chance
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(fencermaster,swordsmanmaster,tkamaster,pikemanmaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(axkva_min, "axkva_min")
