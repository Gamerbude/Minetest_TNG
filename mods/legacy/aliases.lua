-- mods/legacy/aliases.lua
-- =======================
-- See README.txt for licensing and other information.

--
-- Minetest Version < 0.4 compatibility
--

core.register_alias("stone", "default:stone")
core.register_alias("stone_with_coal", "default:stone_with_coal")
core.register_alias("stone_with_iron", "default:stone_with_iron")
core.register_alias("dirt_with_grass", "default:dirt_with_grass")
core.register_alias("dirt_with_grass_footsteps", "default:dirt_with_grass_footsteps")
core.register_alias("dirt", "default:dirt")
core.register_alias("sand", "default:sand")
core.register_alias("gravel", "default:gravel")
core.register_alias("sandstone", "default:sandstone")
core.register_alias("clay", "default:clay")
core.register_alias("brick", "default:brick")
core.register_alias("tree", "default:tree")
core.register_alias("jungletree", "default:jungletree")
core.register_alias("junglegrass", "default:junglegrass")
core.register_alias("leaves", "default:leaves")
core.register_alias("cactus", "default:cactus")
core.register_alias("papyrus", "default:papyrus")
core.register_alias("bookshelf", "default:bookshelf")
core.register_alias("glass", "default:glass")
core.register_alias("wooden_fence", "default:fence_wood")
core.register_alias("rail", "default:rail")
core.register_alias("ladder", "default:ladder")
core.register_alias("wood", "default:wood")
core.register_alias("mese", "default:mese")
core.register_alias("cloud", "default:cloud")
core.register_alias("water_flowing", "default:water_flowing")
core.register_alias("water_source", "default:water_source")
core.register_alias("lava_flowing", "default:lava_flowing")
core.register_alias("lava_source", "default:lava_source")
core.register_alias("torch", "default:torch")
core.register_alias("sign_wall", "default:sign_wall")
core.register_alias("furnace", "default:furnace")
core.register_alias("chest", "default:chest")
core.register_alias("locked_chest", "default:chest_locked")
core.register_alias("cobble", "default:cobble")
core.register_alias("mossycobble", "default:mossycobble")
core.register_alias("steelblock", "default:steelblock")
core.register_alias("nyancat", "default:nyancat")
core.register_alias("nyancat_rainbow", "default:nyancat_rainbow")
core.register_alias("sapling", "default:sapling")
core.register_alias("apple", "default:apple")

core.register_alias("WPick", "default:pick_wood")
core.register_alias("STPick", "default:pick_stone")
core.register_alias("SteelPick", "default:pick_steel")
core.register_alias("MesePick", "default:pick_mese")
core.register_alias("WShovel", "default:shovel_wood")
core.register_alias("STShovel", "default:shovel_stone")
core.register_alias("SteelShovel", "default:shovel_steel")
core.register_alias("WAxe", "default:axe_wood")
core.register_alias("STAxe", "default:axe_stone")
core.register_alias("SteelAxe", "default:axe_steel")
core.register_alias("WSword", "default:sword_wood")
core.register_alias("STSword", "default:sword_stone")
core.register_alias("SteelSword", "default:sword_steel")

core.register_alias("Stick", "default:stick")
core.register_alias("paper", "default:paper")
core.register_alias("book", "default:book")
core.register_alias("lump_of_coal", "default:coal_lump")
core.register_alias("lump_of_iron", "default:iron_lump")
core.register_alias("lump_of_clay", "default:clay_lump")
core.register_alias("steel_ingot", "default:steel_ingot")
core.register_alias("clay_brick", "default:clay_brick")
core.register_alias("snow", "default:snow")


-- 'mese_block' was used for a while for the block form of mese
core.register_alias("default:mese_block", "default:mese")


--
-- MTG compatibility
--

core.register_alias("default:river_water_source", "default:water_source")
core.register_alias("default:river_water_flowing", "default:water_flowing")


--
-- Wrong named pine, acacia and birch wood
--

core.register_alias("default:fence_pinewood", "default:fence_pine_wood")
core.register_alias("default:fence_acaciawood", "default:fence_acacia_wood")
core.register_alias("default:fence_birchwood", "default:fence_birch_wood")
core.register_alias("default:pinetree", "default:pine_tree")
core.register_alias("default:pinewood", "default:pine_wood")

core.register_alias("default:table_pinewood", "default:table_pine_wood")
core.register_alias("default:table_acaciawood", "default:table_acacia_wood")
core.register_alias("default:table_birchwood", "default:table_birch_wood")


--
-- Old Plants mod
--

core.register_alias("plants:vine", "default:vine")
core.register_alias("plants:pear", "default:pear")


--
-- Old Screwdriver mod
--

core.register_alias("screwdriver:screwdriver", "default:screwdriver")
core.register_alias("screwdriver:screwdriver1", "default:screwdriver")
core.register_alias("screwdriver:screwdriver2", "default:screwdriver")
core.register_alias("screwdriver:screwdriver3", "default:screwdriver")
core.register_alias("screwdriver:screwdriver4", "default:screwdriver")


--
-- Old Wool mod
--

core.register_alias("wool:dark_blue", "default:wool_blue")
core.register_alias("wool:gold", "default:wool_yellow")

-- Wrong named fences
core.register_alias("default:fence_pinewood", "default:fence_pine_wood")
core.register_alias("default:fence_acaciawood", "default:fence_acacia_wood")
core.register_alias("default:fence_birchwood", "default:fence_birch_wood")

-- old dye mod
core.register_alias("dye:white", "default:dye_white")
core.register_alias("dye:grey", "default:dye_grey")
core.register_alias("dye:dark_grey", "default:dye_dark_grey")
core.register_alias("dye:black", "default:dye_black")
core.register_alias("dye:red", "default:dye_red")
core.register_alias("dye:orange", "default:dye_orange")
core.register_alias("dye:yellow", "default:dye_yellow")
core.register_alias("dye:green", "default:dye_green")
core.register_alias("dye:cyan", "default:dye_cyan")
core.register_alias("dye:blue", "default:dye_blue")
core.register_alias("dye:violet", "default:dye_violet")
core.register_alias("dye:magenta", "default:dye_magenta")

-- Aliases for old flowers mod
core.register_alias("flowers:flower_rose", "default:flower_rose")
core.register_alias("flowers:flower_tulip", "default:flower_tulip")
core.register_alias("flowers:flower_dandelion_yellow", "default:flower_dandelion_yellow")
core.register_alias("flowers:flower_geranium", "default:flower_geranium")
core.register_alias("flowers:flower_viola", "default:flower_viola")
core.register_alias("flowers:flower_dandelion_white", "default:flower_dandelion_white")

core.register_alias("flowers:rose", "default:flower_rose")
core.register_alias("flowers:tulip", "default:flower_tulip")
core.register_alias("flowers:dandelion_yellow", "default:flower_dandelion_yellow")
core.register_alias("flowers:geranium", "default:flower_geranium")
core.register_alias("flowers:viola", "default:flower_viola")
core.register_alias("flowers:dandelion_white", "default:flower_dandelion_white")

core.register_alias("flowers:mushroom_brown", "default:mushroom_brown")
core.register_alias("flowers:mushroom_red", "default:mushroom_red")

core.register_alias("flowers:waterlily", "default:waterlily")

-- MTG compatibility
core.register_alias("flowers:mushroom_fertile_brown", "default:mushroom_brown")
core.register_alias("flowers:mushroom_fertile_red", "default:mushroom_red")

