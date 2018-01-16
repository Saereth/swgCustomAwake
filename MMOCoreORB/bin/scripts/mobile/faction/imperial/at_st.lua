at_st = Creature:new {
	objectName = "@mob/creature_names:at_st",
	socialGroup = "imperial",
	faction = "imperial",
	level = 70, --SWG Awakening Custom -- Level
	chanceHit = 1, --SWG Awakening Custom -- Chance Hit
	damageMin = 500, --SWG Awakening Custom -- Min Damage
	damageMax = 1000, --SWG Awakening Custom -- Max Damage
	baseXp = 10000, --SWG Awakening Custom -- Base Xp
	baseHAM = 30000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 45000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {35,35,-1,100,100,15,15,100,-1},
	resists = {40,35,35,50,50,25,25,50,-1}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + OVERT,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = NONE,

	idealRange = 40, --SWG Awakening Custom -- Ideal Range
	maxRange = 60, --SWG Awakening Custom -- Max Range

	templates = {"object/mobile/atst.iff"},
	lootGroups = {},
	conversationTemplate = "",
	defaultAttack = "defaultdroidattack",
	defaultWeapon = "object/weapon/ranged/vehicle/vehicle_atst_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(at_st, "at_st")
