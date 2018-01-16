death_watch_battle_droid = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_battle_droid",
	socialGroup = "death_watch",
	faction = "",
	level = 134,
	chanceHit = 7, --SWG Awakening Custom -- Chance Hit
	damageMin = 750, --SWG Awakening Custom -- Min Damage
	damageMax = 1250,  --SWG Awakening Custom -- Max Damage
	baseXp = 12612,
	baseHAM = 65000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 75000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {75,75,100,60,100,25,40,85,-1},
	resists = {75,75,100,75,100,25,70,85,10}, --SWG Awakening Custom -- Resists
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {
		"object/mobile/death_watch_battle_droid.iff",
		"object/mobile/death_watch_battle_droid_02.iff",
		"object/mobile/death_watch_battle_droid_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 10000000}
			},
			lootChance = 500000
		}
	},
	weapons = {"battle_droid_weapons"},
	conversationTemplate = "",
	attacks = merge(pistoleermaster,carbineermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_battle_droid, "death_watch_battle_droid")
