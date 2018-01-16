at_at = Creature:new {
	objectName = "@mob/creature_names:at_at",
	socialGroup = "imperial",
	faction = "imperial",
	level = 228,
	chanceHit = 19.75,
	damageMin = 1270,
	damageMax = 2250,
	baseXp = 21728,
	baseHAM = 750000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 1000000, --SWG Awakening Custom -- Base Ham Max
	armor = 3,
	--resists = {90,90,10,90,90,90,90,100,-1},
	resists = {90,90,90,90,90,90,90,90,20}, --SWG Awakening Custom -- Resists
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

	templates = {"object/mobile/atat.iff"},
	conversationTemplate = "",
	defaultAttack = "defaultdroidattack",
	defaultWeapon = "object/weapon/ranged/vehicle/vehicle_atst_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(at_at, "at_at")
