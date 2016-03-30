default.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, table = true, wall = true},
	stair = {legacy_alias = "stairs:stair_stone"},
	slab = {legacy_alias = "stairs:slab_stone"},
	table = {
		groups = {cracky = 2}
	},
})

default.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, wall = true},
	stair = {legacy_alias = "stairs:stair_desert_stone"},
	slab = {legacy_alias = "stairs:slab_desert_stone"},
})

default.register_node("default:sandstone", {
	register = {stair = true, slab = true, wall = true},
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 2, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_sandstone"},
	slab = {legacy_alias = "stairs:slab_sandstone"},
})

default.register_node("default:obsidian", {
	register = {stair = true, slab = true, wall = true},
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	stair = {legacy_alias = "stairs:stair_obsidian"},
	slab = {legacy_alias = "stairs:slab_obsidian"},
})
