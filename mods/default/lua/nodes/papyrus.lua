default.register_node("default:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy = 3, flammable = 2, stick = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

default.register_node("default:papyrus_block", {
	description = "Papyrus Block",
	tiles = {"default_papyrus_block_top.png", "default_papyrus_block_top.png", "default_papyrus_block_side.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, fuel = 16},
	sounds = default.node_sound_leaves_defaults(),
	register = {stair = true, slab = true, fence = true, fencegate = true},
	stair = {
		name = "default:stair_papyrus",
		legacy_alias = "stairs:stair_papyrus",
	},
	slab = {
		name = "default:slab_papyrus",
		legacy_alias = "stairs:slab_papyrus"
	},
	fence = {
		name = "default:fence_papyrus",
		no_craft = true, -- the crafting recipe is in mods/default/lua/crafting.lua
		groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, fuel = 3},
	},
	fencegate = {
		name = "default:fencegate_papyrus",
		no_craft = true, -- the crafting recipe is in mods/default/lua/crafting.lua
		groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, fuel = 10},
	}
})
