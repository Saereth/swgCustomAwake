death_watch_s_battle_droid = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_super_battle_droid",
	socialGroup = "death_watch",
	faction = "",
	level = 200,
	chanceHit = 25, --SWG Awakening Custom -- Chance Hit
	damageMin = 1000, --SWG Awakening Custom -- Min Damage
	damageMax = 1500, --SWG Awakening Custom -- Max Damage
	baseXp = 19000,
	baseHAM = 170000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 200000, --SWG Awakening Custom -- Base Ham Max
	armor = 3, --SWG Awakening Custom -- Armor
	--resists = {85,95,100,60,100,25,40,85,-1},
	resists = {85,95,100,75,100,25,50,85,25}, --SWG Awakening Custom -- Resists
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
	diet = NONE,
	scale = 1.40,

	templates = {
		"object/mobile/death_watch_s_battle_droid.iff",
		"object/mobile/death_watch_s_battle_droid_02.iff",
		"object/mobile/death_watch_s_battle_droid_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 10000000}
			},
			lootChance = 500000
		}
	},
	conversationTemplate = "",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	defaultAttack = "attack"
}

CreatureTemplates:addCreatureTemplate(death_watch_s_battle_droid, "death_watch_s_battle_droid")
