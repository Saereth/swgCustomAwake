--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakeningRohakConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "awakeningRohhakConvHandler",
	screens = {}
}

--Into Screen.
intro = ConvoScreen:new {
	id = "intro",
	customDialogText = "I feel that the force is strong with you young one. Do you seek training in the ways of the force?",
	stopConversation = "false",
	options = {
		{ "I seek to train in the ways of the force", "under_attack" },
		{ "No, I do not seek the force.", "do_not_seek" }
	}
}
awakeningRohakConvoTemplate:addScreen(intro);

--The village is under attack screen.
under_attack = ConvoScreen:new {
	id = "under_attack",
	customDialogText = "I'm sorry, but we can not help with your training right now. The village of Aurilia is under attack by those who seek to destroy it. Villagers that have not yet fled, are currently fighting back to drive this threat from our peaceful home.",
	stopConversation = "false",
	options = {
		{ "Is there anything I can do to help?", "what_can_i_do" },
	}
}
awakeningRohakConvoTemplate:addScreen(under_attack);

--Seek out a force shrine screen.
what_can_i_do = ConvoScreen:new {
	id = "what_can_i_do",
	customDialogText = "Thank you for your offer, but this conflict is far beyond your training. You must seek further training.",
	stopConversation = "false",
	options = {
		{ "I will go train in the Jedi ways.", "train_fs" },
	}
}
awakeningRohakConvoTemplate:addScreen(what_can_i_do);

--Requirements not met screen.
not_talk = ConvoScreen:new {
	id = "not_talk",
	customDialogText = "I'm sorry, I can not speak with you at this time.",
	stopConversation = "true",
	options = {
	}
}
awakeningRohakConvoTemplate:addScreen(not_talk);

addConversationTemplate("awakeningRohakConvoTemplate", awakeningRohakConvoTemplate);
