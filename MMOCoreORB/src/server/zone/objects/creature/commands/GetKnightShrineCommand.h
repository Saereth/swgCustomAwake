/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef GETKNIGHTSHRINECOMMAND_H_
#define GETKNIGHTSHRINECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class GetKnightShrineCommand : public QueueCommand {
public:

	GetKnightShrineCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == NULL)
			return GENERALERROR;

		if (ghost->getKnightTrialState() > 0) {
			StringBuffer msg;
			String shrineZone = ghost->getKnightTrialFSZoneName();

			msg << "Your Knight Trial shrine is located on: " << shrineZone;
			creature->sendSystemMessage(msg.toString());
		} else {
			creature->sendSystemMessage("You are not in the Knight Trials.");
		}

		return SUCCESS;
		}

};

#endif //GETKNIGHTSHRINECOMMAND_H_
