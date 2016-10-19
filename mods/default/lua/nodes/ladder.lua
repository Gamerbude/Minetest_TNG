-- mods/default/lua/nodes/ladder.lua
-- =================================
-- See README.txt for licensing and other information.

default.register_node("default:ladder", {
	description = "Ladder",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.375, -0.3125, 0.5, 0.5},
			{0.3125, -0.5, 0.375, 0.4375, 0.5, 0.5},
			{-0.5, -0.4375, 0.4375, 0.5, -0.375, 0.5},
			{-0.5, -0.25, 0.4375, 0.5, -0.1875, 0.5},
			{-0.5, -0.0625, 0.4375, 0.5, 0, 0.5},
			{-0.5, 0.125, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0.3125, 0.4375, 0.5, 0.375, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
		}
	},
	tiles = {"default_wood.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	climbable = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2, fuel = 5},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

-- Crafting

core.register_craft({
	output = "default:ladder 2",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})
