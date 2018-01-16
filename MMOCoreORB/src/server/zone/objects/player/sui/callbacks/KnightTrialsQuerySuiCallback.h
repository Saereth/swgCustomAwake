/*
 *	SWG Awakening Custom -- KnightTrialsQuerySuiCallback.h
 *	Copyright (C) <SWG Awakening>
 */

#ifndef KNIGHTTRIALSQUERYSUICALLBACK_H_
#define KNIGHTTRIALSQUERYSUICALLBACK_H_

#include "server/zone/managers/jedi/KnightTrialsManager.h"
#include "server/zone/managers/jedi/Trials.h"
#include "server/zone/objects/player/sui/SuiCallback.h"

class KnightTrialsQuerySuiCallback: public SuiCallback {
public:
	KnightTrialsQuerySuiCallback(ZoneServer* serv) : SuiCallback(serv) {
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!sui->isMessageBox() || cancelPressed)
			return;

		if (!creature->isPlayerCreature())
			return;

		if (!cancelPressed) {
			KnightTrialsManager* trialManager = creature->getZoneServer()->getKnightTrialsManager();

			trialManager->startJediKnightTrial(creature, TrialName::KNIGHT_TRIAL_ONE);
		}
	}
};
#endif
