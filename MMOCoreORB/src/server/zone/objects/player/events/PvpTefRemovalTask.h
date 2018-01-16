
#ifndef PVPTEFREMOVALTASK_H_
#define PVPTEFREMOVALTASK_H_

#include "server/zone/objects/player/PlayerObject.h"

namespace server {
namespace zone {
namespace objects {
namespace player {
namespace events {

class PvpTefRemovalTask: public Task {
	ManagedWeakReference<CreatureObject*> creature;

public:
	PvpTefRemovalTask(CreatureObject* creo) {
		creature = creo;
	}

	void run() {
		ManagedReference<CreatureObject*> player = creature.get();

		if (player == NULL)
			return;

		PlayerObject* ghost = player->getPlayerObject().get();

		if (ghost == NULL) {
			return;
		}

		Locker locker(player);

		//SWG Awakening Custom -- Renew TEF If Player Is In An Opposing Factional Area
		if (ghost->isInOpposingArea())
			ghost->renewTef(1 * 60000);

		if (ghost->hasPvpTef()) {
			this->reschedule(llabs(ghost->getLastPvpCombatActionTimestamp().miliDifference()));
		} else {
			player->clearPvpStatusBit(CreatureFlag::TEF);
			ghost->updateInRangeBuildingPermissions();
		}
	}
};

}
}
}
}
}

using namespace server::zone::objects::player::events;

#endif /* PVPTEFREMOVALTASK_H_ */
