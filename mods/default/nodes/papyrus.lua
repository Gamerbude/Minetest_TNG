core.register_node("default:papyrus", {
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

core.register_node("default:papyrus_block", {
	description = "Papyrus Block",
	tiles = {"default_papyrus_block_top.png", "default_papyrus_block_top.png", "default_papyrus_block.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, fuel = 16},
	sounds = default.node_sound_leaves_defaults()
})
