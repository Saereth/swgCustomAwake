/*
 *	SWG Awakening Custom -- KnightTrialsManagerImplementation.cpp
 *	Copyright (C) <SWG Awakening>
 */

#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"

#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/managers/jedi/KnightTrialsObserver.h"
#include "server/zone/managers/jedi/Trials.h"
#include "server/zone/managers/object/ObjectManager.h"
#include "server/zone/managers/skill/SkillManager.h"

#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/objects/tangible/components/ForceShrineMenuComponent.h"

#include "server/zone/templates/mobile/CreatureTemplate.h"

void KnightTrialsManagerImplementation::jediKnightTrialProgression(CreatureObject* creature, int trialNumber) {
	//TODO: Add the Corvette trial once its implemented then re number from 10 onwards.

	PlayerObject* ghost = creature->getPlayerObject();

 	if (creature == NULL || ghost == NULL)
 		return;

	ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
	int count = ghost->getKnightTrialCcount();
	StringBuffer msg;
	String factionStringRebel = "rebel";
	String factionStringImperial = "imperial";

 	switch (trialNumber) {
 	case TrialName::KNIGHT_TRIAL_ONE:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:tusken_raider " << count << "/19";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_TWO:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:ancient_bull_rancor " << count << "/8";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_THREE:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:stintaril_prowler " << count << "/8";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_FOUR:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:blurrg_raptor " << count << "/3";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_FIVE:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:enraged_kimogila " << count << "/3";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_SIX:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:peko_peko_albatross " << count << "/2";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_SEVEN:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		msg << "@jedi_trials:graul_marauder " << count << "/2";
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_EIGHT:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		if (creature->getFaction() == factionStringImperial.hashCode()) {
			msg << "@jedi_trials:enemy_soldier_dark " << count << "/47";
		} else if (creature->getFaction() == factionStringRebel.hashCode()) {
			msg << "@jedi_trials:enemy_soldier_light " << count << "/47";
		}
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_NINE:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		if (creature->getFaction() == factionStringImperial.hashCode()) {
			msg << "@jedi_trials:high_general_dark " << count << "/22";
		} else if (creature->getFaction() == factionStringRebel.hashCode()) {
			msg << "@jedi_trials:high_general_light " << count << "/22";
		}
		box->setPromptText(msg.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_TEN:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		box->setPromptText("@jedi_trials:geonosian_bunker_acklay");
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_ELEVEN:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		box->setPromptText("@jedi_trials:nightsister_elder");
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_TWELVE:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		box->setPromptText("@jedi_trials:kiin_dray");
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	case TrialName::KNIGHT_TRIAL_THIRTEEN:
		box->setPromptTitle("@jedi_trials:force_shrine_title");
		box->setPromptText("@jedi_trials:giant_canyon_krayt");
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
 		break;
 	default:
 		return;
 		break;
 	}
 }

void KnightTrialsManagerImplementation::startJediKnightTrial(CreatureObject* creature, int trialNumber) {
	//TODO: Add the Corvette trial once its implemented then re number from 10 onwards.
	PlayerObject* ghost = creature->getPlayerObject();

 	if (creature == NULL || ghost == NULL)
 		return;

	Locker clocker(creature);

	String factionStringRebel = "rebel";
	String factionStringImperial = "imperial";
	String cTemplate;
	String cTemplate1;
	String cTemplate2;
	String cTemplate3;
	String cTemplate4;
	String cTemplate5;

	ManagedReference<KnightTrialsObserver*> observer = new KnightTrialsObserver();

	if (creature->getObserverCount(ObserverEventType::TRIALKILLEDCREATURE) == 0) {
 		creature->registerObserver(ObserverEventType::TRIALKILLEDCREATURE, observer);
	}

 	switch (trialNumber) {
 	case TrialName::KNIGHT_TRIAL_ONE:
 		cTemplate = "tusken_raider";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(19);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_ONE_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_ONE);
 		break;
 	case TrialName::KNIGHT_TRIAL_TWO:
 		cTemplate = "ancient_bull_rancor";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(8);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_TWO_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TWO);
 		break;
 	case TrialName::KNIGHT_TRIAL_THREE:
 		cTemplate = "stintaril_prowler";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(8);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_THREE_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_THREE);
 		break;
 	case TrialName::KNIGHT_TRIAL_FOUR:
 		cTemplate = "blurrg_raptor";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(3);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_FOUR_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_FOUR);
 		break;
 	case TrialName::KNIGHT_TRIAL_FIVE:
 		cTemplate = "enraged_kimogila";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(3);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_FIVE_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_FIVE);
 		break;
 	case TrialName::KNIGHT_TRIAL_SIX:
 		cTemplate = "peko_peko_albatross";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(2);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_SIX_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_SIX);
 		break;
 	case TrialName::KNIGHT_TRIAL_SEVEN:
 		cTemplate = "graul_marauder";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(2);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_SEVEN_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_SEVEN);
 		break;
 	case TrialName::KNIGHT_TRIAL_EIGHT:
		if (creature->getFaction() == factionStringImperial.hashCode()) {
			cTemplate = "rebel_commando";
		} else if (creature->getFaction() == factionStringRebel.hashCode()) {
			cTemplate = "stormtrooper_commando";
		}
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(47);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_EIGHT_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_EIGHT);
 		break;
 	case TrialName::KNIGHT_TRIAL_NINE:
		if (creature->getFaction() == factionStringImperial.hashCode()) {
			cTemplate = "rebel_high_general";
			cTemplate1 = "rebel_brigadier_general";
			cTemplate2 = "rebel_general";
			cTemplate3 = "rebel_lieutenant_general";
			cTemplate4 = "rebel_major_general";
			cTemplate5 = "rebel_surface_marshall";
		} else if (creature->getFaction() == factionStringRebel.hashCode()) {
			cTemplate = "imperial_high_general";
			cTemplate1 = "imperial_brigadier_general";
			cTemplate2 = "imperial_general";
			cTemplate3 = "imperial_lieutenant_general";
			cTemplate4 = "imperial_major_general";
			cTemplate5 = "imperial_surface_marshall";
		}
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->addToKnightTrialCreatureList(cTemplate1);
 		ghost->addToKnightTrialCreatureList(cTemplate2);
 		ghost->addToKnightTrialCreatureList(cTemplate3);
 		ghost->addToKnightTrialCreatureList(cTemplate4);
 		ghost->addToKnightTrialCreatureList(cTemplate5);
 		ghost->setKnightTrialCneeded(22);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_NINE_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_NINE);
 		break;
 	case TrialName::KNIGHT_TRIAL_TEN:
 		cTemplate = "acklay";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(1);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_TEN_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TEN);
 		break;
 	case TrialName::KNIGHT_TRIAL_ELEVEN:
 		cTemplate = "nightsister_elder";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(1);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_ELEVEN_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_ELEVEN);
 		break;
 	case TrialName::KNIGHT_TRIAL_TWELVE:
 		cTemplate = "kiin_dray";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(1);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_TWELVE_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_TWELVE);
 		break;
 	case TrialName::KNIGHT_TRIAL_THIRTEEN:
 		cTemplate = "giant_canyon_krayt_dragon";
 		ghost->addToKnightTrialCreatureList(cTemplate);
 		ghost->setKnightTrialCneeded(1);
 		ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_THIRTEEN_INPROGRESS);
 		ghost->setKnightTrialInProgress(true);
 		jediKnightTrialProgression(creature, TrialName::KNIGHT_TRIAL_THIRTEEN);
 		break;
 	default:
 		return;
 		break;
 	}
}

void KnightTrialsManagerImplementation::completeJediKnightTrial(CreatureObject* creature) {
 	PlayerObject* ghost = creature->getPlayerObject();
 	ZoneServer* zserv = creature->getZoneServer();

 	 if (creature == NULL || ghost == NULL)
 	 	return;

 	Locker clocker(creature);

 	StringBuffer msg;
	String side = "";
 	ManagedReference<KnightTrialsObserver*> observer = new KnightTrialsObserver();
 	ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);

	 ghost->clearKnightTrialCreatureList();
	 ghost->setKnightTrialCcount(0);
	 ghost->setKnightTrialCneeded(0);
	 ghost->setKnightTrialState(ghost->getKnightTrialState() + 1);
	 ghost->setKnightTrialInProgress(false);
	 creature->dropObserver(ObserverEventType::TRIALKILLEDCREATURE, observer);

 	if (ghost->getKnightTrialState() < TrialState::KNIGHT_TRIAL_THIRTEEN_COMPLETE) {
 		setForceShrine(creature);
 		String zoneName = ghost->getKnightTrialFSZoneName();

 		box->setPromptTitle("@jedi_trials:knight_trials_next_trial_title");
 		msg << "@jedi_trials:knight_trials_next_trial_msg " << zoneName << " @jedi_trials:knight_trials_next_trial_msg_end";
 		box->setPromptText(msg.toString());
 		ghost->addSuiBox(box);
 		creature->sendMessage(box->generateMessage());

 	} else if (ghost->getKnightTrialState() == TrialState::KNIGHT_TRIAL_THIRTEEN_COMPLETE) {
		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
		box->setPromptTitle("@jedi_trials:knight_trials_title");
		String enclave = ghost->getKnightTrialChosenSide();
		int jediState = 0;

		if (enclave == "light") {
			creature->playMusicMessage("sound/music_become_light_jedi.snd");
			jediState = 4;
		} else if (enclave == "dark") {
			creature->playMusicMessage("sound/music_become_dark_jedi.snd");
			jediState = 8;
		}

		ghost->setJediState(jediState);
		SkillManager::instance()->awardSkill("force_title_jedi_rank_03", creature, true, true, true);
		SkillManager::instance()->awardSkill("force_rank_" + enclave + "_novice", creature, true, true, true);
		ghost->setTitle("force_rank_" + enclave + "_novice", true);
		box->setPromptText("@jedi_trials:knight_trials_completed_" + enclave);
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());

		//Reset Knight Trials
		ghost->setKnightTrialChosenSide(side);
	 	ghost->setKnightTrialState(TrialState::KNIGHT_TRIAL_NOT_STARTED);

	 	//Set to overt
	 	ghost->setFactionStatus(FactionStatus::OVERT);

		if (inventory->isContainerFullRecursive()) {
			creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe");
		}

		String knightRobe = "object/tangible/wearables/robe/robe_jedi_" + enclave + "_s01.iff";
		ManagedReference<SceneObject*> KnightRobe = zserv->createObject(knightRobe.hashCode(), 1);
		if (inventory->transferObject(KnightRobe, -1)) {
			inventory->broadcastObject(KnightRobe, true);
		} else {
			KnightRobe->destroyObjectFromDatabase(true);
		}
 	}
 }

void KnightTrialsManagerImplementation::setForceShrine(CreatureObject* creature) {
	PlayerObject* ghost = creature->getPlayerObject();
	ZoneServer* zserv = creature->getZoneServer();

	String zName = "";
	String zoneName = "";
	float WorldX;
	float WorldY;
	bool validShrine = false;

	while (!validShrine) {
		int randomZone = System::random(zserv->getZoneCount() - 1);
		ManagedReference<Zone*> zone = zserv->getZone(randomZone);
		zName = zone->getZoneName();

		if (zone == NULL || zName == "tutorial" || zName == "dungeon1") {
			continue;
		}

		if (creature->getZone()->getZoneName() == zName)
			continue;

		if (zName == "corellia") {
			zoneName = "Corellia";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = 6300.98, WorldY = 6684.86;
			else if (randomShrine == 1)
				WorldX = -6907.34, WorldY = 4524.26;
			else if (randomShrine == 2)
				WorldX = -7391.64, WorldY = -3941.26;
			else if (randomShrine == 3)
				WorldX = 6092.92, WorldY = -5581.39;
			else
				WorldX = -2384.43, WorldY = 6390.02;
		} else if (zName == "dantooine") {
			zoneName = "Dantooine";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = -6173.19, WorldY = 4117.08;
			else if (randomShrine == 1)
				WorldX = 2163.63, WorldY = 7545.13;
			else if (randomShrine == 2)
				WorldX = 2640.77, WorldY = -1539.78;
			else if (randomShrine == 3)
				WorldX = -1814.18, WorldY = -6205.10;
			else
				WorldX = -6999.37, WorldY = -5272.79;
		} else if (zName == "dathomir") {
			zoneName = "Dathomir";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = 5570.55, WorldY = -1517.44;
			else if (randomShrine == 1)
				WorldX = -4148.17, WorldY = 5923.19;
			else if (randomShrine == 2)
				WorldX = -4961.48, WorldY = -3496.42;
			else if (randomShrine == 3)
				WorldX = 1654.90, WorldY = -5768.23;
			else
				WorldX = 3087.47, WorldY = 4884.14;
		} else if (zName == "endor") {
			zoneName = "Endor";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = -5055.83, WorldY = -1706.40;
			else if (randomShrine == 1)
				WorldX = -5627.48, WorldY = 4810.63;
			else if (randomShrine == 2)
				WorldX = -3870.94, WorldY = -4470.51;
			else if (randomShrine == 3)
				WorldX = 5116.92, WorldY = 1920.96;
			else
				WorldX = 670.40, WorldY = 5545.38;
		} else if (zName == "lok") {
			zoneName = "Lok";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = -5806.68, WorldY = 1974.34;
			else if (randomShrine == 1)
				WorldX = 5455.11, WorldY = 3802.51;
			else if (randomShrine == 2)
				WorldX = -2132.77, WorldY = 5935.68;
			else if (randomShrine == 3)
					WorldX = 4978.77, WorldY = -5677.48;
			else
				WorldX = -3641.14, WorldY = -6033.80;
		} else if (zName == "naboo") {
			zoneName = "Naboo";
			int randomShrine = System::random(3);

			if (randomShrine == 0)
				WorldX = 7182.28, WorldY = -237.99;
			else if (randomShrine == 1)
				WorldX = -6859.10, WorldY = -1940.50;
			else if (randomShrine == 2)
				WorldX = 2377.96, WorldY = -476.98;
			else
				WorldX = -2582.68, WorldY = -6187.62;
		} else if (zName == "rori") {
			zoneName = "Rori";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = -926.13, WorldY = 6043.18;
			else if (randomShrine == 1)
				WorldX = 307.04, WorldY = -981.61;
			else if (randomShrine == 2)
				WorldX = -6375.58, WorldY = 6400.77;
			else if (randomShrine == 3)
				WorldX = 6854.18, WorldY = -1224.95;
			else
				WorldX = -4496.57, WorldY = -7534.98;
		} else if (zName == "talus") {
			zoneName = "Talus";
			int randomShrine = System::random(3);

			if (randomShrine == 0)
				WorldX = 318.11, WorldY = 5839.76;
			else if (randomShrine == 1)
				WorldX = -5494.20, WorldY = -3242.77;
			else if (randomShrine == 2)
				WorldX = -5785.94, WorldY = 4475.12;
			else
				WorldX = 5760.10, WorldY = -5211.07;
		} else if (zName == "tatooine") {
			zoneName = "Tatooine";
			int randomShrine = System::random(4);

			if (randomShrine == 0)
				WorldX = -6505.86, WorldY = -3670.56;
			else if (randomShrine == 1)
				WorldX = 5264.41, WorldY = 110.26;
			else if (randomShrine == 2)
				WorldX = -3622.88, WorldY = 5277.99;
			else if (randomShrine == 3)
				WorldX = 5958.15, WorldY = -5687.21;
			else
				WorldX = 5632.99, WorldY = 6012.32;
		} else if (zName == "yavin4") {
			zoneName = "Yavin4";
			int randomShrine = System::random(3);

			if (randomShrine == 0)
				WorldX = -4585.29, WorldY = -3764.25;
			else if (randomShrine == 1)
				WorldX = 6455.22, WorldY = 6420.27;
			else if (randomShrine == 2)
				WorldX = -3362.30, WorldY = 6911.79;
			else
				WorldX = 2389.65, WorldY = -4937.82;
			}
		if (WorldX == 0 || WorldY == 0) {
			continue;
		}
		validShrine = true;
	}
	Vector3 coords(WorldX, WorldY, 0);
	ghost->setKnightTrialFSCoords(coords);
	ghost->setKnightTrialFSZoneName(zoneName);
}
