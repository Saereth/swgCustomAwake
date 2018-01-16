--*******************************************************************************
--Copyright (C) 2015 - 2017 <SWG Awakening>

--This File is part of the SWG Awakening project.

--This file can not be copied and/or distributed via ANY medium without 
--express written permission from the owner of SWG Awakening.
--*******************************************************************************

object_tangible_loot_loot_schematic_sith_house_loot_schem = object_tangible_loot_loot_schematic_shared_sith_house_loot_schem:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = {"cpp", "LootSchematicMenuComponent"},
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/structure/sith_house_schem.iff",
	targetUseCount = 1
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_sith_house_loot_schem, "object/tangible/loot/loot_schematic/sith_house_loot_schem.iff")