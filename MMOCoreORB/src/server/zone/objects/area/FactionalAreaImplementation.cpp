/*
 *	SWG Awakening Custom -- FactionalAreaImplementation.cpp
 *	Copyright <SWG Awakening>
 */

#include "server/zone/objects/area/FactionalArea.h"
#include "server/zone/objects/creature/CreatureFlag.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/Zone.h"

void FactionalAreaImplementation::notifyEnter(SceneObject* player) {
	if (!player->isPlayerCreature())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);
	PlayerObject* ghost = creature->getPlayerObject();

	if (creature == NULL || ghost == NULL)
		return;

	if (creature->getFaction() == 0 || getAreaFaction() == 0)
		return;

	if (getAreaFaction() != creature->getFaction()) {
		ghost->setIsInOpposingArea(true);
		ghost->updateLastPvpCombatActionTimestamp(5);
	}
}

void FactionalAreaImplementation::notifyExit(SceneObject* player) {
	if (!player->isPlayerCreature())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);
	PlayerObject* ghost = creature->getPlayerObject();

	if (creature == NULL || ghost == NULL)
		return;

	if (creature->getFaction() == 0 || getAreaFaction() == 0)
		return;

	if (getAreaFaction() != creature->getFaction()) {
		ghost->setIsInOpposingArea(false);
		ghost->updateLastPvpCombatActionTimestamp(5);
	}
}
