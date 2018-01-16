light_jedi_sentinel = Creature:new {
	objectName = "@mob/creature_names:light_jedi_sentinel",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "light_jedi", --SWG Awakening Custom -- Social Group
	pvpFaction = "", --SWG Awakening Custom -- PvP Faction
	faction = "rebel", --SWG Awakening Custom -- Faction
	level = 500, --SWG Awakening Custom -- Level
	chanceHit = 30,
	damageMin = 2500, --SWG Awakening Custom -- Min Damage
	damageMax = 3500, --SWG Awakening Custom -- Max Damage
	baseXp = 50000,
	baseHAM = 1106000,
	baseHAMmax = 1352000,
	armor = 3,
	--resists = {95,95,95,95,95,95,95,95,-1},
	resists = {195,195,195,195,195,195,195,195,150}, --SWG Awakening Custom -- Resists
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
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		--SWG Awakening Custom -- Templates
		"object/mobile/dressed_tiberus_anderlock.iff",
		"object/mobile/dressed_neja_bertolo.iff"},
	lootGroups = {
		{
			groups = {
 				--SWG Awakening Custom -- Loot
				{group = "awakening_eliteloot", chance = 100000},
				{group = "crystals_premium", chance = 900000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "holocron_dark", chance = 4000000},
				{group = "holocron_light", chance = 4000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(light_jedi_sentinel, "light_jedi_sentinel")
