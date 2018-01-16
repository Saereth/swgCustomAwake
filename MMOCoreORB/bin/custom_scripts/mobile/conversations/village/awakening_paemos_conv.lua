--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

awakening_paemos_convotemplate = ConvoTemplate:new {
initialScreen = "init",
templateType = "Lua",
luaClassHandler = "awakeningExperienceConverterConvHandler",
screens = {}
}

paemos_init = ConvoScreen:new {
	id = "init",
	leftDialog = "",
	stopConversation = "false",
	options = {
	}
}

awakening_paemos_convotemplate:addScreen(paemos_init);

--Requirements not met screen.
not_talk = ConvoScreen:new {
	id = "not_talk",
	customDialogText = "I'm sorry, I can not speak with you at this time.",
	stopConversation = "true",
	options = {
	}
}
awakening_paemos_convotemplate:addScreen(not_talk);

cs_jsPlumb_1_5 = ConvoScreen:new {
	id = "cs_jsPlumb_1_5",
	leftDialog = "@conversation/fs_experience_converter:s_962f82a6",
	stopConversation = "false",
	options = {
		{"@conversation/fs_experience_converter:s_76fa10e4","cs_jsPlumb_1_11"},
		{"@conversation/fs_experience_converter:s_73ab6ff4","cs_jsPlumb_1_126"},
		{"@conversation/fs_experience_converter:s_968c3ff6","cs_jsPlumb_1_139"},
		{"@conversation/fs_experience_converter:s_2734c210","cs_jsPlumb_1_152"}
	}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_5);

cs_jsPlumb_1_11 = ConvoScreen:new {
id = "cs_jsPlumb_1_11",
leftDialog = "@conversation/fs_experience_converter:s_7542cfea",
stopConversation = "true",
options = {
}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_11);

cs_jsPlumb_1_19 = ConvoScreen:new {
id = "cs_jsPlumb_1_19",
leftDialog = "@conversation/fs_experience_converter:s_37fbfae6",
stopConversation = "true",
options = {
}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_19);

cs_jsPlumb_1_126 = ConvoScreen:new {
id = "cs_jsPlumb_1_126",
leftDialog = "@conversation/fs_experience_converter:s_7542cfea",
stopConversation = "true",
options = {
}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_126);

cs_jsPlumb_1_139 = ConvoScreen:new {
id = "cs_jsPlumb_1_139",
leftDialog = "@conversation/fs_experience_converter:s_7542cfea",
stopConversation = "true",
options = {
}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_139);

cs_jsPlumb_1_152 = ConvoScreen:new {
id = "cs_jsPlumb_1_152",
leftDialog = "@conversation/fs_experience_converter:s_7542cfea",
stopConversation = "true",
options = {
}
}
awakening_paemos_convotemplate:addScreen(cs_jsPlumb_1_152);

addConversationTemplate("awakening_paemos_convotemplate", awakening_paemos_convotemplate);
