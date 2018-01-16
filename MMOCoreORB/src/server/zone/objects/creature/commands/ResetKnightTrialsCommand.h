/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RESETKNIGHTTRIALSCOMMAND_H_
#define RESETKNIGHTTRIALSCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ResetKnightTrialsCommand : public QueueCommand {
public:

	ResetKnightTrialsCommand(const String& name, ZoneProcessServer* server)
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

		if (targetGhost->getKnightTrialState() > 0) {
			Vector3 coords(0, 0, 0);
			String cTemplate = "";
			String side = "";
			String zoneName = "";
		 	targetGhost->clearKnightTrialCreatureList();
		 	targetGhost->setKnightTrialCcount(0);
		 	targetGhost->setKnightTrialCneeded(0);
		 	targetGhost->setKnightTrialState(0);
		 	targetGhost->setKnightTrialInProgress(false);
		 	targetGhost->setKnightTrialChosenSide(side);
		 	targetGhost->setKnightTrialFSCoords(coords);
		 	targetGhost->setKnightTrialFSZoneName(zoneName);

			creature->sendSystemMessage("You have reset the targeted player's Knight Trials.");
		} else {
			creature->sendSystemMessage("Targeted player is not doing the Knight Trials, therefore it cannot be reset.");
		}
		return SUCCESS;
	}

};

#endif //RESETKNIGHTTRIALSCOMMAND_H_
