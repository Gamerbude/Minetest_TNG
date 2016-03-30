default.register_node("default:brick", {
	description = "Brick Block",
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, wall = true},
	stair = {
		description = "Brick Stair",
		legacy_alias = "stairs:stair_brick"
	},
	slab = {
		description = "Brick Slab",
		legacy_alias = "stairs:slab_brick"
	},
	wall = {
		description = "Brick Wall"
	},
})


-- Stonebricks

default.register_node("default:stonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Stone Brick",
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_stonebrick"},
	slab = {legacy_alias = "stairs:slab_stonebrick"},
})

default.register_node("default:desert_stonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Desert Stone Brick",
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_desert_stonebrick"},
	slab = {legacy_alias = "stairs:slab_desert_stonebrick"},
})

default.register_node("default:sandstonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_sandstonebrick"},
	slab = {legacy_alias = "stairs:slab_sandstonebrick"},
})

default.register_node("default:obsidianbrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Obsidian Brick",
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	stair = {legacy_alias = "stairs:stair_obsidianbrick"},
	slab = {legacy_alias = "stairs:slab_obsidianbrick"},
})
