acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "Acklay",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 200, --SWG Awakening Custom -- Level
	chanceHit = 75, --SWG Awakening Custom -- Chance Hit
	damageMin = 6000, --SWG Awakening Custom -- Min Damage
	damageMax = 10000, --SWG Awakening Custom -- Max Damage
	baseXp = 20884, --SWG Awakening Custom -- Base Xp
	baseHAM = 250000, --SWG Awakening Custom -- Base Ham
	baseHAMmax = 350000, --SWG Awakening Custom -- Base Ham Max
	armor = 2,
	--resists = {130,145,155,155,145,30,30,30,-1},
	resists = {185,190,190,190,190,180,170,170,50}, --SWG Awakening Custom -- Resists
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 50, --SWG Awakening Custom -- Ferocity
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	lootGroups = {
		{
			groups = {
				{group = "acklay", chance = 10000000}
			}
		}
	},
	weapons = {"creature_spit_heavy_flame"}, --SWG Awakening Custom -- Weapons
	conversationTemplate = "",
	attacks = {
		--SWG Awakening Custom -- Attacks
		{"strongpoison","stateAccuracyBonus=90"},
		{"creatureareacombo","stateAccuracyBonus=75"},
		{"dizzyattack","stateAccuracyBonus=95"},
		{"creatureareaknockdown","stateAccuracyBonus=95"},
		{"intimidationattack","stateAccuracyBonus=75"},
		{"posturedownattack","stateAccuracyBonus=75"},
		{"stunattack","stateAccuracyBonus=70"}
	}
}

CreatureTemplates:addCreatureTemplate(acklay, "acklay")
