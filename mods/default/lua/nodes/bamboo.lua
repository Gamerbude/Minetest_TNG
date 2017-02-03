-- mods/default/lua/nodes/bamboo.lua
-- =================================
-- See README.txt for licensing and other information.

default.register_node("default:bamboo", {
	description = "Bamboo",
	drawtype = "nodebox",
	tiles = {"default_bamboo_top.png", "default_bamboo_top.png", "default_bamboo.png"},
	inventory_image = "default_bamboo.png",
	wield_image = "default_bamboo.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.5, -0.25, 0.5, 0.5},
			{-0.5, -0.5, -0.25, 0.5, 0.5, -0.25},
			{0.25, -0.5, -0.5, 0.25, 0.5, 0.5},
			{-0.5, -0.5, 0.25, 0.5, 0.5, 0.25},
			{-0.25, 0.5, -0.25, 0.25, 0.5, 0.25},
			{-0.25, -0.5, -0.25, 0.25, -0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, stick = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

default.register_node("default:bamboo_leaves", {
	description = "Bamboo Leaves",
	tiles = {"default_bamboo_leaves.png"},
	paramtype = "light",
	drawtype = "plantlike",
	paramtype2 = "facedir",
	visual_scale = 1.2,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, fuel = 2}	
})
