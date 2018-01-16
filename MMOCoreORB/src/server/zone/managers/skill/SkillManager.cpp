/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
 */

#include "SkillManager.h"
#include "SkillModManager.h"
#include "PerformanceManager.h"
#include "imagedesign/ImageDesignManager.h"
#include "server/zone/objects/creature/variables/Skill.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/badges/Badge.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/templates/TemplateManager.h"
#include "server/zone/templates/datatables/DataTableIff.h"
#include "server/zone/templates/datatables/DataTableRow.h"
#include "server/zone/managers/crafting/schematicmap/SchematicMap.h"
#include "server/zone/packets/creature/CreatureObjectDeltaMessage4.h"
#include "../../packets/creature/CreatureObjectDeltaMessage6.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/objects/tangible/wearables/RobeObject.h"

//SWG Awakening Custom -- Includes
#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/managers/jedi/Trials.h"
#include "server/zone/objects/player/FactionStatus.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"

SkillManager::SkillManager()
: Logger("SkillManager") {

	rootNode = new Skill();

	performanceManager = new PerformanceManager();

	apprenticeshipEnabled = false;
}

SkillManager::~SkillManager() {
}

int SkillManager::includeFile(lua_State* L) {
	String filename = Lua::getStringParameter(L);
	Lua::runFile("scripts/skills/" + filename, L);

	return 0;
}

int SkillManager::addSkill(lua_State* L) {
	LuaObject obj(L);
	SkillManager::instance()->loadSkill(&obj);
	obj.pop();

	return 0;
}

void SkillManager::loadLuaConfig() {
	Lua* lua = new Lua();
	lua->init();

	lua->runFile("scripts/managers/skill_manager.lua");

	apprenticeshipEnabled = lua->getGlobalByte("apprenticeshipEnabled");

	delete lua;
	lua = NULL;
}

void SkillManager::loadClientData() {
	IffStream* iffStream = TemplateManager::instance()->openIffFile("datatables/skill/skills.iff");

	if (iffStream == NULL) {
		error("Could not load skills.");
		return;
	}

	DataTableIff dtiff;
	dtiff.readObject(iffStream);

	delete iffStream;

	for (int i = 0; i < dtiff.getTotalRows(); ++i) {
		DataTableRow* row = dtiff.getRow(i);

		Reference<Skill*> skill = new Skill();
		skill->parseDataTableRow(row);

		Skill* parent = skillMap.get(skill->getParentName().hashCode());

		if (parent == NULL)
			parent = rootNode;

		parent->addChild(skill);

		if (skillMap.put(skill->getSkillName().hashCode(), skill) != NULL) {
			error("overwriting skill name");

			assert(0 && "skill name hashcode error");
		}

		//Load the abilities of the skill into the ability map.
		Vector<String> commands = skill->commands;

		for (int i = 0; i < commands.size(); ++i) {
			String command = commands.get(i);

			if (!abilityMap.containsKey(command)) {
				abilityMap.put(command, new Ability(command));
			}
		}
	}

	loadFromLua();

	//If the admin ability isn't in the ability map, then we want to add it manually.
	if (!abilityMap.containsKey("admin"))
		abilityMap.put("admin", new Ability("admin"));

	// These are not listed in skills.iff and need to be added manually
	if (!abilityMap.containsKey("startMusic+western"))
		abilityMap.put("startMusic+western", new Ability("startMusic+western"));
	if (!abilityMap.containsKey("startDance+theatrical"))
		abilityMap.put("startDance+theatrical", new Ability("startDance+theatrical"));
	if (!abilityMap.containsKey("startDance+theatrical2"))
		abilityMap.put("startDance+theatrical2", new Ability("startDance+theatrical2"));

	loadXpLimits();

	info("Successfully loaded " + String::valueOf(skillMap.size()) + " skills and " + String::valueOf(abilityMap.size()) + " abilities.", true);
}

void SkillManager::loadFromLua() {
	Lua* lua = new Lua();
	lua->init();
	lua_register(lua->getLuaState(), "includeFile", &includeFile);
	lua_register(lua->getLuaState(), "addSkill", &addSkill);

	lua->runFile("scripts/skills/serverobjects.lua");

	delete lua;
}

void SkillManager::loadSkill(LuaObject* luaSkill) {
	Reference<Skill*> skill = new Skill();
	skill->parseLuaObject(luaSkill);
	Skill* parent = skillMap.get(skill->getParentName().hashCode());

	if(parent == NULL) {
		parent = rootNode;
	}

	parent->addChild(skill);
	skillMap.put(skill->getSkillName().hashCode(), skill);

	Vector<String> commands = skill->commands;

	for(int i = 0; i < commands.size(); ++i) {
		String command = commands.get(i);

		if(!abilityMap.containsKey(command)) {
			abilityMap.put(command, new Ability(command));
		}
	}

}

void SkillManager::loadXpLimits() {
	IffStream* iffStream = TemplateManager::instance()->openIffFile("datatables/skill/xp_limits.iff");

	if (iffStream == NULL) {
		error("Could not load skills.");
		return;
	}

	DataTableIff dtiff;
	dtiff.readObject(iffStream);

	delete iffStream;

	for (int i = 0; i < dtiff.getTotalRows(); ++i) {
		DataTableRow* row = dtiff.getRow(i);

		String type;
		int value;
		row->getValue(0, type);
		row->getValue(1, value);
		defaultXpLimits.put(type, value);
		info(type + ": " + String::valueOf(value));
	}
}

void SkillManager::addAbility(PlayerObject* ghost, const String& abilityName, bool notifyClient) {
	Ability* ability = abilityMap.get(abilityName);

	if (ability != NULL)
		ghost->addAbility(ability, notifyClient);
}

void SkillManager::removeAbility(PlayerObject* ghost, const String& abilityName, bool notifyClient) {
	Ability* ability = abilityMap.get(abilityName);

	if (ability != NULL)
		ghost->removeAbility(ability, notifyClient);
}

void SkillManager::addAbilities(PlayerObject* ghost, Vector<String>& abilityNames, bool notifyClient) {
	Vector<Ability*> abilities;

	for (int i = 0; i < abilityNames.size(); ++i) {
		String abilityName = abilityNames.get(i);

		Ability* ability = abilityMap.get(abilityName);

		if (ability != NULL && !ghost->hasAbility(abilityName))
			abilities.add(ability);
	}

	ghost->addAbilities(abilities, notifyClient);
}

void SkillManager::removeAbilities(PlayerObject* ghost, Vector<String>& abilityNames, bool notifyClient) {
	Vector<Ability*> abilities;

	for (int i = 0; i < abilityNames.size(); ++i) {
		String abilityName = abilityNames.get(i);

		Ability* ability = abilityMap.get(abilityName);

		if (ability != NULL && ghost->hasAbility(abilityName))
			abilities.add(ability);
	}

	ghost->removeAbilities(abilities, notifyClient);
}

/*bool SkillManager::checkPrerequisiteSkill(const String& skillName, CreatureObject* creature) {
	return true;
}*/

bool SkillManager::awardSkill(const String& skillName, CreatureObject* creature, bool notifyClient, bool awardRequiredSkills, bool noXpRequired) {
	Skill* skill = skillMap.get(skillName.hashCode());

	if (skill == NULL)
		return false;

	Locker locker(creature);

	//Check for required skills.
	Vector<String>* requiredSkills = skill->getSkillsRequired();
	for (int i = 0; i < requiredSkills->size(); ++i) {
		String requiredSkillName = requiredSkills->get(i);
		Skill* requiredSkill = skillMap.get(requiredSkillName.hashCode());

		if (requiredSkill == NULL)
			continue;

		if (awardRequiredSkills)
			awardSkill(requiredSkillName, creature, notifyClient, awardRequiredSkills, noXpRequired);

		if (!creature->hasSkill(requiredSkillName))
			return false;
	}

	if (!canLearnSkill(skillName, creature, noXpRequired)) {
		return false;
	}

	//If they already have the skill, then return true.
	if (creature->hasSkill(skill->getSkillName()))
		return true;

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

	if (ghost != NULL) {
		//Withdraw skill points.
		ghost->addSkillPoints(-skill->getSkillPointsRequired());

		//Witdraw experience.
		if (!noXpRequired) {
			ghost->addExperience(skill->getXpType(), -skill->getXpCost(), true);
		}

		creature->addSkill(skill, notifyClient);

		//Add skill modifiers
		VectorMap<String, int>* skillModifiers = skill->getSkillModifiers();

		for (int i = 0; i < skillModifiers->size(); ++i) {
			VectorMapEntry<String, int>* entry = &skillModifiers->elementAt(i);
			creature->addSkillMod(SkillModManager::SKILLBOX, entry->getKey(), entry->getValue(), notifyClient);

		}

		//Add abilities
		Vector<String>* abilityNames = skill->getAbilities();
		addAbilities(ghost, *abilityNames, notifyClient);
		if (skill->isGodOnly()) {
			for (int i = 0; i < abilityNames->size(); ++i) {
				String ability = abilityNames->get(i);
				StringIdChatParameter params;
				params.setTU(ability);
				params.setStringId("ui", "skill_command_acquired_prose");

				creature->sendSystemMessage(params);
			}
		}

		//Add draft schematic groups
		Vector<String>* schematicsGranted = skill->getSchematicsGranted();
		SchematicMap::instance()->addSchematics(ghost, *schematicsGranted, notifyClient);

		//Update maximum experience.
		updateXpLimits(ghost);

		// Update Force Power Max.
		ghost->setForcePowerMax(creature->getSkillMod("jedi_force_power_max"), true);

		if (skillName.contains("master")) {
			ManagedReference<PlayerManager*> playerManager = creature->getZoneServer()->getPlayerManager();
			if (playerManager != NULL) {
				const Badge* badge = BadgeList::instance()->get(skillName);

				if (badge == NULL && skillName == "crafting_shipwright_master") {
					badge = BadgeList::instance()->get("crafting_shipwright");
				}

				if (badge != NULL) {
					playerManager->awardBadge(ghost, badge);
				}
			}
		}

		SkillList* list = creature->getSkillList();

		int totalSkillPointsWasted = 250;

		for (int i = 0; i < list->size(); ++i) {
			Skill* skill = list->get(i);

			totalSkillPointsWasted -= skill->getSkillPointsRequired();
		}

		if (ghost->getSkillPoints() != totalSkillPointsWasted) {
			creature->error("skill points mismatch calculated: " + String::valueOf(totalSkillPointsWasted) + " found: " + String::valueOf(ghost->getSkillPoints()));
			ghost->setSkillPoints(totalSkillPointsWasted);
		}

		ManagedReference<PlayerManager*> playerManager = creature->getZoneServer()->getPlayerManager();
		if (playerManager != NULL) {
			creature->setLevel(playerManager->calculatePlayerLevel(creature));
		}

		//SWG Awakening Custom -- Jedi System, Grant Proper Jedi Title And State Upon 24 FS Skill Spent
		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
		if (skillName.contains("force_sensitive_") && getForceSensitiveSkillCount(creature, false) >= 24) {
			//Grant The Initiate skill to new Jedi
			if (creature->hasSkill("force_title_jedi_novice") && !creature->hasSkill("force_title_jedi_rank_01")) {
				box->setPromptTitle("Ways Of The Force");
				StringBuffer msg;
				msg << "A mysterious voice fills your mind: I sense that you've grown considerably stronger since I first became aware of your presence young padawan. "
						<< "Seek out a force shrine and meditate.\n\nAfter your meditation, seek out your Jedi trainer. The few Jedi trainers that are still alive after the great purge stay hidden from the Empire. "
						<< "Seek them out by using the /findmytrainercommand.\n\nRemember, Jedi are hunted ruthlessly by the Empire, so it is best to keep a low profile and not draw uneeded attention to yourself.\n\nMay The Force Be With You.";
				box->setPromptText(msg.toString());

				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
				awardSkill("force_title_jedi_rank_01", creature, true, true, true);

			//Set state back to 2 on existing Jedi who were forced to respec
			} else if (creature->hasSkill("force_title_jedi_rank_02") && ghost->getJediState() < 2 && ghost->jediRespecInProgress()) {
				box->setPromptTitle("Jedi System");
				String msg = "You have now reached atleast 24 skill points invested into the FS skill trees. \n\nYou now qualify for Jedi skills. Visit your normal Jedi trainer to get started.";
				box->setPromptText(msg);

				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());

				ghost->setJediState(2);
			}
		}

		//SWG Awakening Custom -- Knight Trials, Start Trials Upon Requirements Being Met
		if (skillName.contains("force_discipline_") && knightPrereqsMet(creature, "")) {
			//Trigger Knight Trials on new Knights
			if (creature->hasSkill("force_title_jedi_rank_02") && !creature->hasSkill("force_title_jedi_rank_03") && ghost->getKnightTrialState() == TrialState::KNIGHT_TRIAL_NOT_STARTED) {
				ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
				KnightTrialsManager* trialManager = creature->getZoneServer()->getKnightTrialsManager();

				trialManager->setForceShrine(creature);
				ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_STARTED);

				StringBuffer msg;
				String zoneName = ghost->getKnightTrialFSZoneName();

				box->setPromptTitle("@jedi_trials:knight_trials_title");
				msg << "@jedi_trials:knight_trials_intro_msg " << zoneName << " @jedi_trials:knight_trials_intro_msg_end";
				box->setPromptText(msg.toString());
				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
			//SWG Awakening Custom -- Jedi System, Grant Jedi Knight To Those Who Were Forced To Respec
			} else if (creature->hasSkill("force_title_jedi_rank_03") && ghost->getJediState() < 4 && ghost->jediRespecInProgress()) {
				box->setPromptTitle("Jedi System");
				String msg = "You have now fulfilled the Knight requirements after your respec. Your Knight title has be added and you've been set back to Overt.";
				box->setPromptText(msg);

				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());

				ghost->setFactionStatus(FactionStatus::OVERT);

				if (creature->hasSkill("force_rank_dark_novice")) {
					ghost->setJediState(8);
				} else if (creature->hasSkill("force_rank_light_novice")) {
					ghost->setJediState(4);
				}
			}
		}
	}

	/// Update client with new values for things like Terrain Negotiation
	CreatureObjectDeltaMessage4* msg4 = new CreatureObjectDeltaMessage4(creature);
	msg4->updateAccelerationMultiplierBase();
	msg4->updateAccelerationMultiplierMod();
	msg4->updateSpeedMultiplierBase();
	msg4->updateSpeedMultiplierMod();
	msg4->updateRunSpeed();
	msg4->updateTerrainNegotiation();
	msg4->close();
	creature->sendMessage(msg4);

	SkillModManager::instance()->verifySkillBoxSkillMods(creature);

	return true;
}

bool SkillManager::surrenderSkill(const String& skillName, CreatureObject* creature, bool notifyClient, bool forceSurrender) {
	Skill* skill = skillMap.get(skillName.hashCode());

	if (skill == NULL)
		return false;

	Locker locker(creature);

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

	if(ghost != NULL) {
		//SWG Awakening Custom -- Jedi System, Players Can Not Abandon The Force Sensitive Title
		if (skillName == "force_title_jedi_novice") {
			creature->sendSystemMessage("You can not abandon the Force Sensitive skill box.");
			return false;
		}

		//SWG Awakening Custom -- Jedi System, Players Can Not Fall Below 24 FS Skill Points Spent With The Initiate Title
		if (skillName.beginsWith("force_sensitive_") && getForceSensitiveSkillCount(creature, false) <= 24 && creature->hasSkill("force_title_jedi_rank_01")) {
			creature->sendSystemMessage ("You can not abandon any more Force Sensitive skills without first surrendering the Jedi Initiate title.");
			return false;
		}

		//SWG Awakening Custom -- Jedi System, Players Can Not Fall Below The Requirements Of Knight
		if (!forceSurrender && creature->hasSkill("force_title_jedi_rank_03") && skillName.contains("force_discipline_") && !knightPrereqsMet(creature, skillName)) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("@jedi_spam:cant_revoke_title");
			box->setPromptText("@jedi_spam:cant_revoke_prompt");

			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			return false;
		}

		//SWG Awakening Custom -- Jedi System, Players Can Not Drop Title Boxes if they have the accompanying FRS boxes
		if ((skillName.contains("force_title_jedi_rank_03") && (creature->hasSkill("force_rank_light_novice") || creature->hasSkill("force_rank_dark_novice")))) {
			if (!forceSurrender) {
				ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
				box->setPromptTitle("@jedi_spam:cant_revoke_title");
				box->setPromptText("@jedi_spam:cant_revoke_prompt");

				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
				return false;
			}
		}
	}

	SkillList* skillList = creature->getSkillList();

	for (int i = 0; i < skillList->size(); ++i) {
		Skill* checkSkill = skillList->get(i);
		if (!forceSurrender && checkSkill->isRequiredSkillOf(skill))
			return false;
	}

	//If they have already surrendered the skill, then return true.
	if (!creature->hasSkill(skill->getSkillName()))
		return true;

	creature->removeSkill(skill, notifyClient);

	//Remove skill modifiers
	VectorMap<String, int>* skillModifiers = skill->getSkillModifiers();

	for (int i = 0; i < skillModifiers->size(); ++i) {
		VectorMapEntry<String, int>* entry = &skillModifiers->elementAt(i);
		creature->removeSkillMod(SkillModManager::SKILLBOX, entry->getKey(), entry->getValue(), notifyClient);

	}

	if (ghost != NULL) {
		//Give the player the used skill points back.
		ghost->addSkillPoints(skill->getSkillPointsRequired());

		//Remove abilities but only if the creature doesn't still have a skill that grants the
		//ability.  Some abilities are granted by multiple skills. For example Dazzle for dancers
		//and musicians.
		Vector<String>* skillAbilities = skill->getAbilities();
		if (skillAbilities->size() > 0) {
			SortedVector<String> abilitiesLost;
			for (int i = 0; i < skillAbilities->size(); i++) {
				abilitiesLost.put(skillAbilities->get(i));
			}
			for (int i = 0; i < skillList->size(); i++) {
				Skill* remainingSkill = skillList->get(i);
				Vector<String>* remainingAbilities = remainingSkill->getAbilities();
				for(int j = 0; j < remainingAbilities->size(); j++) {
					if (abilitiesLost.contains(remainingAbilities->get(j))) {
						abilitiesLost.drop(remainingAbilities->get(j));
						if (abilitiesLost.size() == 0) {
							break;
						}
					}
				}
			}
			if (abilitiesLost.size() > 0) {
				removeAbilities(ghost, abilitiesLost, notifyClient);
			}
		}

		//Remove draft schematic groups
		Vector<String>* schematicsGranted = skill->getSchematicsGranted();
		SchematicMap::instance()->removeSchematics(ghost, *schematicsGranted, notifyClient);

		//Update maximum experience.
		updateXpLimits(ghost);

		// Update Force Power Max
		ghost->setForcePowerMax(creature->getSkillMod("jedi_force_power_max"), true);

		SkillList* list = creature->getSkillList();

		int totalSkillPointsWasted = 250;

		for (int i = 0; i < list->size(); ++i) {
			Skill* skill = list->get(i);

			totalSkillPointsWasted -= skill->getSkillPointsRequired();
		}

		if (ghost->getSkillPoints() != totalSkillPointsWasted) {
			creature->error("skill points mismatch calculated: " + String::valueOf(totalSkillPointsWasted) + " found: " + String::valueOf(ghost->getSkillPoints()));
			ghost->setSkillPoints(totalSkillPointsWasted);
		}

		ManagedReference<PlayerManager*> playerManager = creature->getZoneServer()->getPlayerManager();
		if (playerManager != NULL) {
			creature->setLevel(playerManager->calculatePlayerLevel(creature));
		}

		if (!forceSurrender) {
			//SWG Awakening Custom -- Jedi System, Remove Jedi Knight Title Box If Novice Rank Is Surrendered
			if (skillName.contains("force_rank_light_novice") || skillName.contains("force_rank_dark_novice")) {
				creature->removeSkill("force_title_jedi_rank_03", true);
				ghost->setJediState(2);
			}

			//SWG Awakening Custom -- Jedi System, Set Jedi State To 1 If Padawan Is Surrendered
			if (skillName.contains("force_title_jedi_rank_02"))
				ghost->setJediState(1);
		}
	}

	/// Update client with new values for things like Terrain Negotiation
	CreatureObjectDeltaMessage4* msg4 = new CreatureObjectDeltaMessage4(creature);
	msg4->updateAccelerationMultiplierBase();
	msg4->updateAccelerationMultiplierMod();
	msg4->updateSpeedMultiplierBase();
	msg4->updateSpeedMultiplierMod();
	msg4->updateRunSpeed();
	msg4->updateTerrainNegotiation();
	msg4->close();
	creature->sendMessage(msg4);

	SkillModManager::instance()->verifySkillBoxSkillMods(creature);

	return true;
}

void SkillManager::surrenderAllSkills(CreatureObject* creature, bool notifyClient) {
	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

	SkillList* skillList = creature->getSkillList();

	Vector<String> listOfNames;
	skillList->getStringList(listOfNames);
	SkillList copyOfList;

	copyOfList.loadFromNames(listOfNames);

	for (int i = 0; i < copyOfList.size(); i++) {
		Skill* skill = copyOfList.get(i);

		if (skill->getSkillPointsRequired() > 0) {
			creature->removeSkill(skill, notifyClient);

			//Remove skill modifiers
			VectorMap<String, int>* skillModifiers = skill->getSkillModifiers();

			for (int i = 0; i < skillModifiers->size(); ++i) {
				VectorMapEntry<String, int>* entry = &skillModifiers->elementAt(i);
				creature->removeSkillMod(SkillModManager::SKILLBOX, entry->getKey(), entry->getValue(), notifyClient);

			}

			SkillModManager::instance()->verifySkillBoxSkillMods(creature);

			if (ghost != NULL) {
				//Give the player the used skill points back.
				ghost->addSkillPoints(skill->getSkillPointsRequired());

				//Remove abilities
				Vector<String>* abilityNames = skill->getAbilities();
				removeAbilities(ghost, *abilityNames, notifyClient);

				//Remove draft schematic groups
				Vector<String>* schematicsGranted = skill->getSchematicsGranted();
				SchematicMap::instance()->removeSchematics(ghost, *schematicsGranted, notifyClient);

				/// update force
				ghost->setForcePowerMax(creature->getSkillMod("jedi_force_power_max"), true);
			}
		}
	}
}

void SkillManager::awardDraftSchematics(Skill* skill, PlayerObject* ghost, bool notifyClient) {
	if (ghost != NULL) {
		//Add draft schematic groups
		Vector<String>* schematicsGranted = skill->getSchematicsGranted();
		SchematicMap::instance()->addSchematics(ghost, *schematicsGranted, notifyClient);
	}
}

void SkillManager::updateXpLimits(PlayerObject* ghost) {
	if (ghost == NULL || !ghost->isPlayerObject()) {
		return;
	}

	VectorMap<String, int>* xpTypeCapList = ghost->getXpTypeCapList();

	//Clear all xp limits to the default limits.
	for (int i = 0; i < defaultXpLimits.size(); ++i) {
		String xpType = defaultXpLimits.elementAt(i).getKey();
		int xpLimit = defaultXpLimits.elementAt(i).getValue();

		if (xpTypeCapList->contains(xpType)) {
			xpTypeCapList->get(xpType) = xpLimit;
		} else {
			xpTypeCapList->put(xpType, xpLimit);
		}
	}

	//Iterate over the player skills and update xp limits accordingly.
	ManagedReference<CreatureObject*> player = cast<CreatureObject*>(ghost->getParentRecursively(SceneObjectType::PLAYERCREATURE).get().get());

	if(player == NULL)
		return;

	SkillList* playerSkillBoxList = player->getSkillList();

	for(int i = 0; i < playerSkillBoxList->size(); ++i) {
		Skill* skillBox = playerSkillBoxList->get(i);

		if (skillBox == NULL)
			continue;

		if (xpTypeCapList->contains(skillBox->getXpType()) && (xpTypeCapList->get(skillBox->getXpType()) < skillBox->getXpCap())) {
			xpTypeCapList->get(skillBox->getXpType()) = skillBox->getXpCap();
		}
	}

	//Iterate over the player xp types and cap all xp types to the limits.
	DeltaVectorMap<String, int>* experienceList = ghost->getExperienceList();

	for (int i = 0; i < experienceList->size(); ++i) {
		String xpType = experienceList->getKeyAt(i);

		//SWG Awakening Custom -- Jedi Forced Respec System, Bypass Experience Cap
		if (ghost->jediRespecInProgress() && xpType == "jedi_general")
			continue;

		if (experienceList->get(xpType) > xpTypeCapList->get(xpType)) {
			ghost->addExperience(xpType, xpTypeCapList->get(xpType) - experienceList->get(xpType), true);
		}
	}
}

bool SkillManager::canLearnSkill(const String& skillName, CreatureObject* creature, bool noXpRequired) {
	Skill* skill = skillMap.get(skillName.hashCode());

	if (skill == NULL) {
		return false;
	}

	//If they already have the skill, then return false.
	if (creature->hasSkill(skillName)) {
		return false;
	}

	if (!fullfillsSkillPrerequisites(skillName, creature)) {
		return false;
	}

	ManagedReference<PlayerObject* > ghost = creature->getPlayerObject();
	if (ghost != NULL) {
		//Check if player has enough xp to learn the skill.
		if (!noXpRequired) {
			if (ghost->getExperience(skill->getXpType()) < skill->getXpCost()) {
				return false;
			}
		}

		//Check if player has enough skill points to learn the skill.
		if (ghost->getSkillPoints() < skill->getSkillPointsRequired()) {
			return false;
		}
	} else {
		//Could not retrieve player object.
		return false;
	}


	return true;
}

bool SkillManager::fullfillsSkillPrerequisitesAndXp(const String& skillName, CreatureObject* creature) {
	if (!fullfillsSkillPrerequisites(skillName, creature))
		return false;

	Skill* skill = skillMap.get(skillName.hashCode());

	if (skill == NULL) {
		return false;
	}

	ManagedReference<PlayerObject* > ghost = creature->getPlayerObject();
	if (ghost != NULL) {
		//SWG Awakening Custom -- Jedi Forced Respec System,Bypass Experience Requirement
		bool bypassXpReq = false;
		if (skillName.contains("force_sensitive_")) {
			if (ghost != NULL && ghost->jediRespecInProgress())
				bypassXpReq = true;
		}
		if (!bypassXpReq) {
			//Check if player has enough xp to learn the skill.
			if (skill->getXpCost() > 0 && ghost->getExperience(skill->getXpType()) < skill->getXpCost()) {
				return false;
			}
		}
	}

	return true;
}

bool SkillManager::fullfillsSkillPrerequisites(const String& skillName, CreatureObject* creature) {

	Skill* skill = skillMap.get(skillName.hashCode());

	if (skill == NULL)
		return false;

	Vector<String>* requiredSpecies = skill->getSpeciesRequired();
	if (requiredSpecies->size() > 0) {
		bool foundSpecies = false;
		for (int i = 0; i < requiredSpecies->size(); i++) {
			if (creature->getSpeciesName() == requiredSpecies->get(i)) {
				foundSpecies = true;
				break;
			}
		}
		if (!foundSpecies) {
			return false;
		}
	}

	//Check for required skills.
	Vector<String>* requiredSkills = skill->getSkillsRequired();
	for (int i = 0; i < requiredSkills->size(); ++i) {
		String requiredSkillName = requiredSkills->get(i);
		Skill* requiredSkill = skillMap.get(requiredSkillName.hashCode());

		if (requiredSkill == NULL)
			continue;

		if (!creature->hasSkill(requiredSkillName))
			return false;
	}

	PlayerObject* ghost = creature->getPlayerObject();
	if(ghost == NULL || ghost->getJediState() < skill->getJediStateRequired()) {
		return false;
	}

	if (ghost->isPrivileged())
		return true;

	//SWG Awakening Custom -- Jedi System, Players Must Meet The FS Skill Requirements To Learn Jedi Skills
	if (skillName.contains("force_discipline_") && getForceSensitiveSkillCount(creature, false) < 24) {
		return false;
	}

	//SWG Awakening Custom -- Jedi System, Players Must Meet The FS Skill Requirements To Be Granted The Initiate Title
	if (skillName == "force_title_jedi_rank_01" && getForceSensitiveSkillCount(creature, false) < 24) {
		return false;
	}

	//SWG Awakening Custom -- Jedi System, Players Must Meet The Knight Requirements To Be Granted The Knight Title
	if (skillName == "force_title_jedi_rank_03" && !knightPrereqsMet(creature, "")) {
		return false;
	}

	return true;
}

int SkillManager::getForceSensitiveSkillCount(CreatureObject* creature, bool includeNoviceMasterBoxes) {
	SkillList* skills =  creature->getSkillList();
	int forceSensitiveSkillCount = 0;

	for(int i = 0; i < skills->size(); ++i) {
		String skillName = skills->get(i)->getSkillName();
		if(skillName.contains("force_sensitive_") && (includeNoviceMasterBoxes || skillName.indexOf("0") != -1)) {
			forceSensitiveSkillCount++;
		}
	}

	return forceSensitiveSkillCount;
}

bool SkillManager::knightPrereqsMet(CreatureObject* creature, const String& skillNameBeingDropped) {
	SkillList* skillList = creature->getSkillList();

	int fullTrees = 0;
	int totalJediPoints = 0;

	for(int i = 0; i < skillList->size(); ++i) {
		Skill* skill = skillList->get(i);

		String skillName = skill->getSkillName();
		if(skillName.contains("force_discipline_") &&
			(skillName.indexOf("0") != -1 || skillName.contains("novice") || skillName.contains("master") )) {
			totalJediPoints += skill->getSkillPointsRequired();

			if(skillName.indexOf("4") != -1) {
				fullTrees++;
			}
		}
	}

	if(!skillNameBeingDropped.isEmpty()) {
		Skill* skillBeingDropped = skillMap.get(skillNameBeingDropped.hashCode());

		if(skillNameBeingDropped.indexOf("4") != -1) {
			fullTrees--;
		}

		totalJediPoints -= skillBeingDropped->getSkillPointsRequired();
	}

	return fullTrees >= 2 && totalJediPoints >= 206;
}
