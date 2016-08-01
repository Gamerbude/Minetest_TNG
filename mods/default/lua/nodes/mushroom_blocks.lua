-- mods/default/lua/nodes/mushroom_blocks.lua
-- ===========================================
-- See README.txt (in this mod) for licensing and other information.

--
-- Brown Mushroom
--

-- Trunk / Log
default.register_node("default:mushroom_brown_log", {
	description =  "Brown Mushrooom Log",
	tiles = {"default_mushroom_brown_log_top.png", "default_mushroom_brown_log_top.png", "default_mushroom_brown_log_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
	drop = {
		items = {
			{items = {"default:mushroom_brown"}, max = 2, rarity = 2}
		}
	},
})

-- Top
default.register_node("default:mushroom_brown_top", {
	description =  "Brown Mushrooom Top",
	tiles = {"default_mushroom_brown_top.png", "default_mushroom_brown_top_inner.png", "default_mushroom_brown_top.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
	drop = {
		items = {
			{items = {"default:mushroom_brown"}, max = 2, rarity = 2}
		}
	},
})

--
-- Red Mushroom
--

-- Trunk / Log
default.register_node("default:mushroom_red_log", {
	description =  "Red Mushrooom Log",
	tiles = {"default_mushroom_red_log_top.png", "default_mushroom_red_log_top.png", "default_mushroom_red_log_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
	drop = {
		items = {
			{items = {"default:mushroom_red"}, max = 2, rarity = 2}
		}
	},
})

-- Top
default.register_node("default:mushroom_red_top", {
	description =  "Red Mushrooom Top",
	tiles = {"default_mushroom_red_top.png", "default_mushroom_red_top_inner.png", "default_mushroom_red_top.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
	drop = {
		items = {
			{items = {"default:mushroom_red"}, max = 2, rarity = 2}
		}
	},
})
