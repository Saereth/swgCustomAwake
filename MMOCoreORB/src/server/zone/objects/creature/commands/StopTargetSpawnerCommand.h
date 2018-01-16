/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STOPTARGETSPAWNERCOMMAND_H_
#define STOPTARGETSPAWNERCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class StopTargetSpawnerCommand : public QueueCommand {
public:

	StopTargetSpawnerCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return SUCCESS;
	}

};

#endif //STOPTARGETSPAWNERCOMMAND_H_
