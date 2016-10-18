 default.register_node("default:japanese_wall", {
	description = "japanese style wall",
	inventory_image = "default_japanese_wall.png",
	wield_image = "default_japanese_wall.png",
	wield_scale = {x = 1, y = 1, z = 1 + 1/16},
	tiles = {
		"default_japanese_wall.png",
		"default_japanese_wall.png",
		"default_japanese_wall.png",
		"default_japanese_wall.png",
		"default_japanese_wall.png",
		"default_japanese_wall.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0}, -- NodeBox1
			{0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox6
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox7
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox8
			{-0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox9
			{-0.5, -0.5, -0.0625, 0.5, -0.4375, 0.0625}, -- NodeBox12
			{-0.5, -0.0625, -0.0625, 0.5, 0.0625, 0.0625}, -- NodeBox13
		}
	},
	walkable = true,
	groups = {choppy = 2, dig_immediate = 3, flammable = 3},
	drop = "default:japanese_wall",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox1
		},
	},
})

core.register_craft({
	output = "default:japanese_wall",
	recipe = {
		{"default:paper", "group:stick", "default:paper"},
		{"group:stick", "group:stick", "group:stick"},
		{"default:paper", "group:stick", "default:paper"},
	}
})
