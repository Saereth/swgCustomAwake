/*
 *	SWG Awakening Custom -- KnightTrialsChoiceMenuSuiCallback.h
 *	Copyright (C) <SWG Awakening>
 */

#ifndef KNIGHTTRIALSCHOICEMENUSUICALLBACK_H_
#define KNIGHTRIALSCHOICEMENUSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"

class KnightTrialsChoiceMenuSuiCallback : public SuiCallback {
public:
	KnightTrialsChoiceMenuSuiCallback(ZoneServer* serv) : SuiCallback(serv) {
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		ManagedReference<SuiMessageBox*> wrongChoice = new SuiMessageBox(creature, SuiWindowType::NONE);
		ManagedReference<SuiMessageBox*> completeBox = new SuiMessageBox(creature, SuiWindowType::NONE);
		completeBox->setPromptTitle("@jedi_trials:force_shrine_title");
		wrongChoice->setPromptTitle("@jedi_trials:force_shrine_title");
		String side;
		String chosenSide;

		if (!sui->isListBox() || cancelPressed) {
			creature->sendSystemMessage("@jedi_trials:council_choice_delayed");
			return;
		}

		int index = Integer::valueOf(args->get(0).toString());

		if (index == 0) {
			side = "rebel";
			chosenSide = "light";
			completeBox->setPromptText("@jedi_trials:council_chosen_light");
		} else {
			side = "imperial";
			chosenSide = "dark";
			completeBox->setPromptText("@jedi_trials:council_chosen_dark");
		}

		if (creature->getFaction() != side.hashCode()) {
			if (side == "rebel")
				wrongChoice->setPromptText("@jedi_trials:faction_wrong_choice_light");
			else
				wrongChoice->setPromptText("@jedi_trials:faction_wrong_choice_dark");

			ghost->addSuiBox(wrongChoice);
			creature->sendMessage(wrongChoice->generateMessage());

			return;
		}
		ghost->setKnightTrialChosenSide(chosenSide);
		ghost->addSuiBox(completeBox);
		creature->sendMessage(completeBox->generateMessage());
	}
};

#endif /* KNIGHTTRIALSCHOICEMENUSUICALLBACK_H_ */
