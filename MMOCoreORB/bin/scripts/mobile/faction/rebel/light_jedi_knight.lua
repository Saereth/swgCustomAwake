--SWG Awakening Custom -- Light Jedi Knight Mobile
light_jedi_knight = Creature:new {
	objectName = "@mob/creature_names:light_jedi_knight",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "light_jedi",
	pvpFaction = "",
	faction = "rebel",
	level = 250,
	chanceHit = 25,
	damageMin = 1500,
	damageMax = 3000,
	baseXp = 25266,
	baseHAM = 300000,
	baseHAMmax = 350000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,20},
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
	creatureBitmask = KILLER + STALKER,
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
				{group = "awakening_loot", chance = 500000},
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "crystals_select", chance = 600000},
				{group = "rifles", chance = 1300000},
				{group = "pistols", chance = 1300000},
				{group = "melee_weapons", chance = 1300000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000},
				{group = "carbines", chance = 1300000},
				{group = "wearables_scarce", chance = 800000}
			},
			lootChance = 8000000
		}
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(light_jedi_knight, "light_jedi_knight")
