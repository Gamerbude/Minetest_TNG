-- Minerals

default.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	paramtype = "light",
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
	light_source = 1,
})

default.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

default.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})



-- Blocks

default.register_node("default:coalblock", {
	register = {stair = true, slab = true},
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3, fuel = 370},
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:steelblock", {
	register = {stair = true, slab = true},
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_steelblock"},
	slab = {legacy_alias = "stairs:slab_steelblock"},
})

default.register_node("default:copperblock", {
	register = {stair = true, slab = true},
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_copperblock"},
	slab = {legacy_alias = "stairs:slab_copperblock"},
})

default.register_node("default:bronzeblock", {
	register = {stair = true, slab = true},
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_bronzeblock"},
	slab = {legacy_alias = "stairs:slab_bronzeblock"},
})

default.register_node("default:goldblock", {
	register = {stair = true, slab = true},
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_goldblock"},
	slab = {legacy_alias = "stairs:slab_goldblock"},
})

default.register_node("default:diamondblock", {
	register = {stair = true, slab = true},
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_diamondblock"},
	slab = {legacy_alias = "stairs:slab_diamondblock"},
})
