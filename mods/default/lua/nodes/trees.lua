default.register_tree("default:apple", {
	-- name can be used for default.grow_tree["<tree name>"](pos)
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	log = {
		name = "default:tree",
		description = "Log",
		tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"}
	},
	leaves = {
		name = "default:leaves",
		description = "Leaves",
		texture = "default_leaves.png",
		texture_special = "default_leaves_simple.png",
	},
	sapling = {
		name = "default:sapling",
		description = "Sapling",
		texture = "default_sapling.png",
		growtime = 300,
		growing_type = "schematic_and_function",
		schematic = default.get_schematic_path("default", "apple_tree_from_sapling.mts"),
		schematic_size = {x = 2, y = 1, z = 2},
		mgv6_grow = function(pos)
			if not default.can_grow(pos) then
				return false
			end

			return default.grow_apple_tree(pos, math.random(1, 4) == 1) --  see mods/default/lua/apis/tree_growing.lua
		end
	},
	planks = {
		name = "default:wood",
		description = "Wooden Planks",
		description_prefix = "Wooden",
		texture = "default_wood.png"
	},
	mapgen = {
		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 1,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		schematic = default.get_schematic_path("default", "apple_tree.mts"),
	},
})

default.register_tree("default:jungle", {
	description = "Jungle",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	log = {
		name = "default:jungletree",
		tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"}
	},
	leaves = {
		name = "default:jungleleaves",
		texture = "default_jungleleaves.png",
		texture_special = "default_jungleleaves_simple.png",
		sapling_rarity = 24
	},
	sapling = {
		name = "default:junglesapling",
		description = "Jungle Sapling",
		texture = "default_junglesapling.png",
		growtime = 270, -- 4.5 min -> in average 5.4 min
		growing_type = "schematic_and_function",
		mgv6_grow = function(pos)
			if not default.can_grow(pos) then
				return false
			end

			return default.grow_jungle_tree(pos)
		end,
		schematic = default.get_schematic_path("default", "jungle_tree_from_sapling.mts"),
		schematic_size = {x = 2, y = 1, z = 2},
	},
	planks = {
		name = "default:junglewood",
		description = "Junglewood Planks",
		description_prefix = "Junglewood",
		texture = "default_junglewood.png"
	},
	mapgen = {
		place_on = {"default:dirt_with_grass", "default:dirt"},
		sidelen = 80,
		fill_ratio = 0.09,
		biomes = {"rainforest", "rainforest_swamp"},
		schematic = default.get_schematic_path("default", "jungle_tree.mts"),
	},
})

default.register_tree("default:pine", {
	description = "Pine",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	texture_prefix = "default_pine",
	leaves = {
		name = "default:pine_needles",
		description = "Pine Needles",
		texture = "default_pine_needles.png",
		texture_special = "default_pine_needles_simple.png",
		sapling_rarity = 24,
	},
	sapling = {
		growing_type = "schematic",
		growtime = 330, -- 5.5 min
		schematic = default.get_schematic_path("default", "pine_tree_from_sapling.mts"),
		schematic_size = {x = 2, y = 1, z = 2},
	},
	mapgen = {
		place_on = {"default:snowblock", "default:dirt_with_grass"},
		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		schematic = default.get_schematic_path("default", "pine_tree.mts"),
	},
})

default.register_tree("default:acacia", {
	description = "Acacia",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	texture_prefix = "default_acacia",
	schematic = core.get_modpath("default") .. "/schematics/acacia_tree_from_sapling.mts",
	schematic_size = {x = 4, y = 1, z = 4},
	sapling = {
		growtime = 420, -- 7 min -> in average 8.4 min
		growing_type = "schematic",
		schematic = default.get_schematic_path("default", "acacia_tree_from_sapling.mts"),
		schematic_size = {x = 4, y = 1, z = 4},
	},
	mapgen = {
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 80,
		noise_params = {
			offset = 0,
			scale = 0.003,
			spread = {x = 250, y = 250, z = 250},
			seed = 3,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		schematic = default.get_schematic_path("default", "acacia_tree.mts"),
	},
})

default.register_tree("default:birch", {
	description = "Birch",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	texture_prefix = "default_birch",
	sapling = {
		growtime = 420, -- 7 min -> in average 8.4 min
		growing_type = "schematic",
		schematic = default.get_schematic_path("default", "birch_tree_from_sapling.mts"),
		schematic_size = {x = 2, y = 1, z = 2},
	},
	mapgen = {
		noise_params = {
			offset = 0.01,
			scale = -0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 4,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"birch_forest_sandstone",  "deciduous_forest"},
		schematic = default.get_schematic_path("default", "birch_tree.mts"),
	},
})

default.register_tree("default:maple", {
	description = "Maple",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	texture_prefix = "default_maple",
	sapling = {
		growtime = 360, -- 6 min
		growing_type = "schematic",
		schematic = default.get_schematic_path("default", "maple_tree_from_sapling.mts"),
		schematic_size = {x = 3, y = 0, z = 3},
	},
	mapgen = {
		noise_params = {
			offset = 0.01,
			scale = -0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 5,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"maple_forest",  "mixed_maple_forest"},
		schematic = default.get_schematic_path("default", "maple_tree.mts"),
	},
})

default.register_tree("default:red_maple", {
	description = "Red Maple",
	register = {leaves = true, sapling = true, mapgen = true},
	texture_prefix = "default_red_maple",
	sapling = {
		growtime = 390, -- 6.5 min
		growing_type = "schematic",
		schematic_size = {x = 3, y = 0, z = 3},
		schematic = default.get_schematic_path("default", "red_maple_tree_from_sapling.mts"),
	},
	mapgen = {
		noise_params = {
			offset = 0.01,
			scale = -0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 6,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"red_maple_forest",  "mixed_maple_forest"},
		schematic = default.get_schematic_path("default", "red_maple_tree.mts"),
	},
})

default.register_tree("default:cherry", {
	description = "Cherry",
	register = {leaves = true, sapling = true, log = true, planks = true, mapgen = true},
	texture_prefix = "default_cherry",
	leaves = {
		name = "default:cherry_blossoms",
		texture = "default_cherry_blossoms.png",
		description = "Cherry Blossoms",
	},
	log = {
		description = "Cherry Tree Log",
	},
	planks = {
		description = "Cherry Tree Planks",
	},
	sapling = {
		growtime = 480, -- 8 min
		growing_type = "schematic",
		schematic_size = {x = 2, y = 0, z = 2},
		schematic = default.get_schematic_path("default", "cherry_tree_from_sapling.mts"),
	},
	mapgen = {
		noise_params = {
			offset = 0.01,
			scale = -0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 8,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"cherry_tree_forest"},
		schematic = default.get_schematic_path("default", "cherry_tree.mts"),
	},
})
