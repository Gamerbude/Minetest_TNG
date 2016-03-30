default.register_node("default:cobble", {
	register = {stair = true, slab = true, table = true, wall = true},
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_cobble"},
	slab = {legacy_alias = "stairs:slab_cobble"},
	table = {
		groups = {cracky = 2},
	},
})

default.register_node("default:mossycobble", {
	register = {stair = true, slab = true, wall = true},
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:desert_cobble", {
	register = {stair = true, slab = true, wall = true},
	description = "Desert Cobblestone",
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_desert_cobble"},
	slab = {legacy_alias = "stairs:slab_desert_cobble"},
})
