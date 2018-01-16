/*
 *	SWG Awakening Custom -- ETerminalTemplate.h
 *	Copyright (C) <SWG Awakening>
 */

#ifndef ETERMINALTEMPLATE_H_
#define ETERMINALTEMPLATE_H_

#include "../SharedTangibleObjectTemplate.h"
#include "server/zone/objects/tangible/terminal/eterminal/ETerminalMenuNode.h"

class ETerminalTemplate : public SharedTangibleObjectTemplate {
	Reference<ETerminalMenuNode*> rootNode;

	int terminalperformanceBuff;
	int terminalmedicalBuff;
	int terminalperformanceDuration;
	int terminalmedicalDuration;

public:
	ETerminalTemplate() : rootNode(NULL), terminalperformanceBuff(0),
		terminalmedicalBuff(0), terminalperformanceDuration(0), terminalmedicalDuration(0) {
	}

	~ETerminalTemplate() {
		if (rootNode != NULL) {
			//delete rootNode;
			rootNode = NULL;
		}
	}

	void readObject(LuaObject* templateData) {
		SharedTangibleObjectTemplate::readObject(templateData);

		terminalperformanceBuff = templateData->getIntField("terminalperformanceBuff");
		terminalmedicalBuff = templateData->getIntField("terminalmedicalBuff");
		terminalperformanceDuration = templateData->getIntField("terminalperformanceDuration");
		terminalmedicalDuration = templateData->getIntField("terminalmedicalDuration");

		LuaObject luaItemList = templateData->getObjectField("itemList");

		//Ensure that the luaItemList root level is of an even order.
		if (luaItemList.getTableSize() % 2 != 0) {
			System::out << "[ETerminalTemplate] Dimension mismatch in itemList. Item count must be a multiple of 2." << endl;
			luaItemList.pop();
			return;
		}

		rootNode = new ETerminalMenuNode("root");
		rootNode->readLuaObject(luaItemList, true);

		luaItemList.pop();
    }

    inline ETerminalMenuNode* getItemList() const {
        return rootNode;
    }

    inline int getTerminalPerformanceBuff() const {
    	return terminalperformanceBuff;
    }

    inline int getTerminalMedicalBuff() const {
    	return terminalmedicalBuff;
    }

    inline int getTerminalPerformanceDuration() const {
    	return terminalperformanceDuration;
    }

    inline int getTerminalMedicalDuration() const {
    	return terminalmedicalDuration;
    }

};



#endif /* ETERMINALTEMPLATE_H_ */
