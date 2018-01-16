senior_specforce_heavy_weapons_specialist = Creature:new {
	objectName = "@mob/creature_names:senior_specforce_heavy_weapons_specialist",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 70, --SWG Awakening Custom -- Level
	chanceHit = 2, --SWG Awakening Custom -- Chance Hit
	damageMin = 750, --SWG Awakening Custom -- Min Damage
	damageMax = 1250, --SWG Awakening Custom -- Max Damage
	baseXp = 5000, --SWG Awakening Custom -- Base Xp
	baseHAM = 10000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 12500, --SWG Awakening Custom -- Base Ham Max
	armor = 0,
	--resists = {0,0,0,0,0,0,0,-1,-1},
	resists = {40,40,30,40,40,20,20,40,-1}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + OVERT, --SWG Awakening Custom -- PvP Bitmask
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128, --SWG Awakening Custom -- Options Bitmask
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_rebel_second_lieutenant_human_female_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_rodian_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_trandoshan_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_twk_female_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_twk_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_zabrak_female_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 4700000},
				{group = "rifles", chance = 1000000},
				{group = "pistols", chance = 1000000},
				{group = "melee_weapons", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "clothing_attachments", chance = 100000},
				{group = "armor_attachments", chance = 100000},
				{group = "wearables_common", chance = 1000000}
			}
		}
	},
	weapons = {"rebel_weapons_heavy"},
	reactionStf = "@npc_reaction/military",
	personalityStf = "@hireling/hireling_military",
	attacks = merge(commandomaster,marksmanmaster,brawlermaster,fencermaster,tkamaster) --SWG Awakening Custom -- Attacks
}

CreatureTemplates:addCreatureTemplate(senior_specforce_heavy_weapons_specialist, "senior_specforce_heavy_weapons_specialist")
