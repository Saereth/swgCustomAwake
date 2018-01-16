/*
 * ForceShrinenMenuComponent.cpp
 *
 *  Created on: 01/23/2012
 *      Author: Valkyra
 */

#include "ForceShrineMenuComponent.h"

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/objects/region/CityRegion.h"

#include "server/zone/ZoneServer.h"

//SWG Awakening Custom -- Includes
#include "server/chat/ChatManager.h"
#include "server/settings/ServerSettings.h"
#include "server/zone/managers/jedi/JediManager.h"
#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/managers/jedi/Trials.h"
#include "server/zone/objects/player/sui/callbacks/KnightTrialsChoiceMenuSuiCallback.h"
#include "server/zone/objects//player/sui/callbacks/KnightTrialsQuerySuiCallback.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"

void ForceShrineMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	menuResponse->addRadialMenuItem(213, 3, "@jedi_trials:meditate"); // Meditate

	//SWG Awakening Custom -- Jedi System, Add Padawan Robe Replacement Menu Option
	if (player->hasSkill("force_title_jedi_rank_02"))
		menuResponse->addRadialMenuItem(214, 3, "Jedi Robe Replacement");

	//SWG Awakening Custom -- Jedi System, Add Progression Check Menu Option
	if (ServerSettings::instance()->getShrineProgressionEnabled())
		menuResponse->addRadialMenuItem(215, 3, "Meditate you must...");

}

int ForceShrineMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) const {
	if (selectedID != 213 && selectedID != 214 && selectedID != 215)
		return 0;

	if (creature->getPosture() != CreaturePosture::CROUCHED){
		creature->sendSystemMessage("@jedi_trials:show_respect"); // Must show respect
		return 0;
	}

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

	if (ghost == NULL)
		return 0;

	ZoneServer* zserv = creature->getZoneServer();

	if (zserv == NULL)
		return 0;

	if (selectedID == 213) {
		if (creature->hasSkill("force_title_jedi_rank_01") && !creature->hasSkill("force_title_jedi_rank_02")) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("@jedi_trials:padawan_trials_title"); // Jedi Trials
			box->setPromptText("@jedi_trials:padawan_trials_completed");

			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());

			//SWG Awakening Custom -- Jedi System, Send Unlock Announcement
			if (ServerSettings::instance()->getUnlockMessageEnabled()) {
				if (ghost->getUnlockAnnounced() == 0) {
					ChatManager* chatManager = zserv->getChatManager();
					chatManager->broadcastGalaxy(NULL, ServerSettings::instance()->getUnlockMessage());
					ghost->setUnlockAnnounced(1);
				}
			}

			SkillManager::instance()->awardSkill("force_title_jedi_rank_02", creature, true, true, true);

			creature->playEffect("clienteffect/trap_electric_01.cef", ""); // Not sure if it's the right one for this.

			PlayMusicMessage* pmm = new PlayMusicMessage("sound/music_become_jedi.snd");
			creature->sendMessage(pmm);

			ghost->setJediState(2);

			// Find a trainer.
			findTrainerObject(creature, ghost.get());

			ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

			//Check if inventory is full.
			if (inventory->isContainerFullRecursive()) {
				creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
				return 0;
			}

			String PadawanRobe = "object/tangible/wearables/robe/robe_jedi_padawan.iff";
			ManagedReference<SceneObject*> padawanRobe = zserv->createObject(PadawanRobe.hashCode(), 1);
			if (inventory->transferObject(padawanRobe, -1)) {
				inventory->broadcastObject(padawanRobe, true);
			} else {
				padawanRobe->destroyObjectFromDatabase(true);
			}

		} else if (creature->hasSkill("force_title_jedi_rank_02") && !creature->hasSkill("force_title_jedi_rank_03") && SkillManager::instance()->knightPrereqsMet(creature, "")) {

			int state = ghost->getKnightTrialState();
			String chosenSide = ghost->getKnightTrialChosenSide();
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			KnightTrialsManager* trialManager = creature->getZoneServer()->getKnightTrialsManager();

			Vector3 playerShrine = ghost->getKnightTrialFSCoords();
			String shrineZone = sceneObject->getZone()->getZoneName();
			String playerShrineZone = ghost->getKnightTrialFSZoneName().toLowerCase();

			float shrineX = sceneObject->getWorldPositionX();
			float shrineY = sceneObject->getWorldPositionY();
			float playerShrineX = playerShrine.getX();
			float playerShrineY = playerShrine.getY();
			float diff = 0.5;

			int rand = System::random(14) + 1;
			StringBuffer sysmsg;
			sysmsg << "@jedi_trials:force_shrine_wisdom_" << rand;

			if (state == TrialState::KNIGHT_TRIAL_STARTED) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					box->setPromptTitle("@jedi_trials:force_shrine_title"); // Meditating at a Force Shrine...
					box->setPromptText("@jedi_trials:knight_trials_start_query"); // You are eligible to undertake the Jedi Knight trials. Would you like to start them?
					box->setCallback(new KnightTrialsQuerySuiCallback(zserv));
					ghost->addSuiBox(box);
					creature->sendMessage(box->generateMessage());
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_ONE_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_ONE);
			} else if (state == TrialState::KNIGHT_TRIAL_ONE_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_TWO);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_TWO_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TWO);
			} else if (state == TrialState::KNIGHT_TRIAL_TWO_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_THREE);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_THREE_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_THREE);
			} else if (state == TrialState::KNIGHT_TRIAL_THREE_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_FOUR);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_FOUR_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_FOUR);
			} else if (state == TrialState::KNIGHT_TRIAL_FOUR_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_FIVE);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_FIVE_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_FIVE);
			} else if (state == TrialState::KNIGHT_TRIAL_FIVE_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_SIX);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_SIX_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_SIX);
			} else if (state == TrialState::KNIGHT_TRIAL_SIX_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_SEVEN);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_SEVEN_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_SEVEN);
			} else if (state == TrialState::KNIGHT_TRIAL_SEVEN_COMPLETE && chosenSide == "") {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					//Faction Check.
					if (creature->getFaction() == 0) {
						creature->sendSystemMessage("You must declare a faction before continuing the Knight trials.");
						return 0;
					}
					ManagedReference<SuiListBox*> suiCouncilDecision = new SuiListBox(creature, SuiWindowType::NONE, SuiListBox::HANDLETWOBUTTON);

					suiCouncilDecision->setPromptTitle("@jedi_trials:force_shrine_title");
					suiCouncilDecision->setPromptText("@jedi_trials:council_choice_msg");
					suiCouncilDecision->addMenuItem("@jedi_trials:button_lightside");
					suiCouncilDecision->addMenuItem("@jedi_trials:button_darkside");
					suiCouncilDecision->setCancelButton(true, "@jedi_trials:button_cancel");
					suiCouncilDecision->setOkButton(false, "@jedi_trials:button_okay");
					suiCouncilDecision->setCallback(new KnightTrialsChoiceMenuSuiCallback(ghost->getZoneServer()));

					ghost->addSuiBox(suiCouncilDecision);
					ghost->sendMessage(suiCouncilDecision->generateMessage());
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_SEVEN_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_EIGHT);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_EIGHT_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_EIGHT);
			} else if (state == TrialState::KNIGHT_TRIAL_EIGHT_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_NINE);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_NINE_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_NINE);
			} else if (state == TrialState::KNIGHT_TRIAL_NINE_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_TEN);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_TEN_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TEN);
			} else if (state == TrialState::KNIGHT_TRIAL_TEN_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_ELEVEN);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_ELEVEN_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_ELEVEN);
			} else if (state == TrialState::KNIGHT_TRIAL_ELEVEN_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_TWELVE);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_TWELVE_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TWELVE);
			} else if (state == TrialState::KNIGHT_TRIAL_TWELVE_COMPLETE) {
				if ((fabs(shrineX - playerShrineX) < diff) && (fabs(shrineY - playerShrineY) < diff) && playerShrineZone == shrineZone) {
					trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_THIRTEEN);
				} else {
					creature->sendSystemMessage(sysmsg.toString());
				}
			} else if (state == TrialState::KNIGHT_TRIAL_THIRTEEN_INPROGRESS) {
				trialManager->jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_THIRTEEN);
			} else {
				creature->sendSystemMessage(sysmsg.toString());
			}
		} else {
			int rand = System::random(14) + 1;
			StringBuffer sysmsg;
			sysmsg << "@jedi_trials:force_shrine_wisdom_" << rand;

			creature->sendSystemMessage(sysmsg.toString());
		}

	//SWG Awakening Custom -- Padawan Robe Replacement
		if (selectedID == 214) {
			if (creature->hasSkill("force_title_jedi_rank_02") && !creature->hasSkill("force_title_jedi_rank_03")) {
				ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

				//Check if inventory is full.
				if (inventory->isContainerFullRecursive()) {
					creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
					return 0;
				}

				String PadawanRobe = "object/tangible/wearables/robe/robe_jedi_padawan.iff";
				ManagedReference<SceneObject*> padawanRobe = zserv->createObject(PadawanRobe.hashCode(), 1);
				if (inventory->transferObject(padawanRobe, -1)) {
					inventory->broadcastObject(padawanRobe, true);
				} else {
					padawanRobe->destroyObjectFromDatabase(true);
				}
			} else	if (creature->hasSkill("force_title_jedi_rank_03")) {
					ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

					//Check if inventory is full.
					if (inventory->isContainerFullRecursive()) {
						creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
						return 0;
					}

					String KnightRobe;
					String factionStringRebel = "rebel";
					String factionStringImperial = "imperial";

					if (creature->getFaction() == factionStringRebel.hashCode())
						KnightRobe = "object/tangible/wearables/robe/robe_jedi_light_s01.iff";
					else
						KnightRobe = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff";

					ManagedReference<SceneObject*> knightRobe = zserv->createObject(KnightRobe.hashCode(), 1);
					if (inventory->transferObject(knightRobe, -1)) {
						inventory->broadcastObject(knightRobe, true);
					} else {
						knightRobe->destroyObjectFromDatabase(true);
					}
				}
			}

	//SWG Awakening Custom -- Jedi Unlock Progression
	} else if (selectedID == 215) {
		JediManager::instance()->checkForceStatusCommand(creature);
	}
	return 0;
}

void ForceShrineMenuComponent::findTrainerObject(CreatureObject* player, PlayerObject* ghost) const {

	// Trainer number. Pick a random trainer, there are at least 600 in the galaxy.
	ZoneServer* zserv = player->getZoneServer();
	Vector<String> trainerTypes;

	// Map categories defined here.
	trainerTypes.add("trainer_brawler");
	trainerTypes.add("trainer_artisan");
	trainerTypes.add("trainer_scout");
	trainerTypes.add("trainer_marksman");
	trainerTypes.add("trainer_entertainer");
	trainerTypes.add("trainer_medic");

	bool found = false;
	Vector3 coords;
	String zoneName = "";

	// This specifies the number of attempts at a retry. The first is min, second int is max amount of attemps.
	int counter = 0;
	int retriesCounter = 40;

	while (!found && counter < retriesCounter) {
		// Increment counter to prevent infinite loop.
		++counter;

		Zone* zone = zserv->getZone(System::random(zserv->getZoneCount() - 1));

		if (zone == NULL || zone->getZoneName() == "tutorial") {
			continue;
		}


		SortedVector<ManagedReference<SceneObject*> > trainers = zone->getPlanetaryObjectList(trainerTypes.get(System::random(trainerTypes.size() - 1)));

		int size = trainers.size();

		if (size <= 0) {
			continue;
		}

		ManagedReference<SceneObject*> trainer = trainers.get(System::random(size - 1));

		if (trainer == NULL) {
			continue;
		}

		ManagedReference<CreatureObject*> trainerCreo = trainer.castTo<CreatureObject*>();

		if (trainerCreo == NULL) {
			continue;
		}

		if (!(trainerCreo->getOptionsBitmask() & OptionBitmask::CONVERSE)) {
			continue;
		}

		ManagedReference<CityRegion*> city = trainerCreo->getCityRegion();

		// Make sure it's not a player-city trainer.
		if (city != NULL && !city->isClientRegion()){
			continue;
		}

		zoneName = trainerCreo.get()->getZone()->getZoneName();
		coords = trainerCreo.get()->getWorldPosition();
		found = true;

	}

	ghost->setTrainerCoordinates(coords);
	ghost->setTrainerZoneName(zoneName); // For the Waypoint.
}

