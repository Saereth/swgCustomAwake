/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SETKNIGHTTRIALCOMMAND_H_
#define SETKNIGHTTRIALCOMMAND_H_

#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/objects/scene/SceneObject.h"

class SetKnightTrialCommand : public QueueCommand {
public:

	SetKnightTrialCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		//Check privileges
		if (ghost == NULL || !ghost->isPrivileged())
			return INSUFFICIENTPERMISSION;

		ManagedReference<CreatureObject*> targetCreature = NULL;
		ManagedReference<PlayerObject*> targetGhost = NULL;
		ManagedReference<SceneObject*> targetObject = server->getZoneServer()->getObject(target);

		if (targetObject != NULL) {
			if (targetObject->isPlayerCreature()) {
				targetCreature = cast<CreatureObject*>(targetObject.get());
				targetGhost = targetCreature->getPlayerObject();
			} else {
				creature->sendSystemMessage("Invalid target.");
				return INVALIDTARGET;
			}
		}

		if (targetGhost == NULL)
			return GENERALERROR;

		Locker clocker(targetObject, creature);

		int trialState = 0;
		try {
			UnicodeTokenizer tokenizer(arguments);

			trialState = tokenizer.getIntToken();

		} catch (Exception& e) {
			creature->sendSystemMessage("Syntax: /setKnightTrial <trial #>.");
				return GENERALERROR;
		}

		if (trialState > 6 && targetCreature->getFaction() == 0) {
			creature->sendSystemMessage("Your target must be aligned with a faction to continue the Knight Trials.");
			return GENERALERROR;
		}

		KnightTrialsManager* trialManager = creature->getZoneServer()->getKnightTrialsManager();
		StringBuffer msg;
		String side = "";
		String factionStringRebel = "rebel";
		String factionStringImperial = "imperial";

		if (trialState > 6) {
			if (targetCreature->getFaction() == factionStringRebel.hashCode()) {
				side = "light";
			} else if (targetCreature->getFaction() == factionStringImperial.hashCode()) {
				side = "dark";
			}
			targetGhost->setKnightTrialChosenSide(side);
		}

		trialManager->startJediKnightTrial(targetCreature, trialState);
		msg << "You have set " << targetCreature->getFirstName() << " to Knight Trial state: " << trialState <<".";
		creature->sendSystemMessage(msg.toString());
		return SUCCESS;
	}

};

#endif //SETKNIGHTTRIALCOMMAND_H_
