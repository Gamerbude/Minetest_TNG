default.register_node("default:apple", {
	description = "Apple",
	drawtype = "nodebox",
	tiles = {"default_apple_top.png", "default_apple_bottom.png", "default_apple.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16,	-7/16,	-3/16,	3/16,	1/16,	3/16},
			{-4/16,	-6/16,	-3/16,	4/16,	0,		3/16},
			{-3/16,	-6/16,	-4/16,	3/16,	0,		4/16},
			{-1/32,	1/16,	-1/32,	1/32,	4/16,	1/32},
			{-1/16,	1.6/16,	0,		1/16,	1.8/16,	1/16},
			{-2/16,	1.4/16,	1/16,	1/16,	1.6/16,	2/16},
			{-2/16,	1.2/16,	2/16,	0,		1.4/16,	3/16},
			{-1.5/16,	1/16,	.5/16,	0.5/16,	1.2/16,	2.5/16},
		}
	},
	visual_scale = 0.7,
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.3, -0.2, 0.2, 0.23, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
})

