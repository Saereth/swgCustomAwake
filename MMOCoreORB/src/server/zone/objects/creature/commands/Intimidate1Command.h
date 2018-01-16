/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef INTIMIDATE1COMMAND_H_
#define INTIMIDATE1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "server/zone/packets/object/CombatSpam.h"
#include "server/chat/ChatMessage.h"
#include "CombatQueueCommand.h"

//SWG Awakening Custom -- Includes
#include "server/zone/objects/tangible/weapon/WeaponObject.h"

class Intimidate1Command : public CombatQueueCommand {
public:

	Intimidate1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Reference<TangibleObject*> targetObject = server->getZoneServer()->getObject(target).castTo<TangibleObject*>();

		if (targetObject == NULL || !targetObject->isCreatureObject())
			return INVALIDTARGET;

		//SWG Awakening Custom -- Intimidate Can Not Be Used With A Jedi Weapon
		ManagedReference<WeaponObject*> weapon = creature->getWeapon();
		if (weapon != NULL && weapon->isJediWeapon())
			return INVALIDWEAPON;

		int res = doCombatAction(creature, target);

		if (res == TOOFAR && creature->isPlayerCreature()) {
			CombatSpam* msg = new CombatSpam(creature, targetObject, creature, NULL, 0, "cbt_spam", "intim_out_of_range", 0);
			creature->sendMessage(msg);
		}
		
		if (res == SUCCESS && creature->isPlayerCreature()) {
			ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

			if (ghost != NULL && !ghost->getCommandMessageString(STRING_HASHCODE("intimidate1")).isEmpty() && creature->checkCooldownRecovery("command_message")) {
				UnicodeString shout(ghost->getCommandMessageString(STRING_HASHCODE("intimidate1")));
				server->getChatManager()->broadcastChatMessage(creature, shout, 0, 0, 80, ghost->getLanguageID());
				creature->updateCooldownTimer("command_message", 30 * 1000);
			}
		}
		return res;
	}

};

#endif //INTIMIDATE1COMMAND_H_
