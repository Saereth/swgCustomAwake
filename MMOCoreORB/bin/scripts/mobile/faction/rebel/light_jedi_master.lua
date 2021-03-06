--SWG Awakening Custom -- Light Master Mobile
light_jedi_master = Creature:new {
	objectName = "@mob/creature_names:light_jedi_master",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "light_jedi",
	pvpFaction = "",
	faction = "rebel",
	level = 300,
	chanceHit = 30,
	damageMin = 1800,
	damageMax = 3300,
	baseXp = 27849,
	baseHAM = 400000,
	baseHAMmax = 450000,
	armor = 3,
	resists = {192,192,192,192,192,192,192,192,130},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_trainer_old_human_male_01.iff",
		"object/mobile/dressed_jedi_trainer_chiss_male_01.iff",
		"object/mobile/dressed_jedi_trainer_nikto_male_01.iff",
		"object/mobile/dressed_jedi_trainer_twilek_female_01.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "awakening_eliteloot", chance = 50000},
				{group = "awakening_loot", chance = 500000},
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "crystals_premium", chance = 600000},
				{group = "rifles", chance = 1300000},
				{group = "pistols", chance = 1300000},
				{group = "melee_weapons", chance = 1300000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000},
				{group = "carbines", chance = 1300000},
				{group = "wearables_scarce", chance = 800000}
			},
			lootChance = 9000000
		}
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(light_jedi_master, "light_jedi_master")
