/*
 *	SWG Awakening Custom -- KnightTrialsObserverImplementation.cpp
 *	Copyright (C) <SWG Awakening>
 */

#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"

#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/managers/jedi/KnightTrialsObserver.h"
#include "server/zone/managers/object/ObjectManager.h"

#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"

#include "server/zone/templates/mobile/CreatureTemplate.h"

int KnightTrialsObserverImplementation::notifyObserverEvent(uint32 eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {

	CreatureObject* creature = cast<CreatureObject*>( observable);
	PlayerObject* ghost = creature->getPlayerObject();

 	if (creature == NULL || ghost == NULL)
 		return 0;

 	int count = ghost->getKnightTrialCcount();
 	int needed = ghost->getKnightTrialCneeded();

	if (eventType == ObserverEventType::TRIALKILLEDCREATURE) {
		CreatureObject* creatureKilled = cast<CreatureObject*>(arg1);
		AiAgent* agent = cast<AiAgent*>(creatureKilled);

		if (agent == NULL)
			return 0;

		CreatureTemplate* creatureTemplate = agent->getCreatureTemplate();

		if (creatureTemplate == NULL)
			return 0;

		if (ghost->hasInKnightTrialCreatureList(creatureTemplate->getTemplateName())) {
			if (count < needed) {
		 		ghost->setKnightTrialCcount(count + 1);
			}
			 if (ghost->getKnightTrialCcount() >= needed) {
				KnightTrialsManager* trialManager = creature->getZoneServer()->getKnightTrialsManager();
			 	trialManager->completeJediKnightTrial(creature);
			 }
		}
	}
	return 0;
}
