default.register_tree("default:apple_tree", { -- can be used for default.grow_tree[<tree name>](pos)
	schematic = core.get_modpath("default") .. "/schematics/apple_tree_from_sapling.mts",
	schematic_size = {x = 2, y = 1, z = 2},
	-- not the real size of the schematic, its about how much the schematic has to move from the pos of the sapling
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
		mgv6_grow = function(pos)
			if not default.can_grow() then
				return false
			end
			
			return default.grow_apple_tree(pos, math.random(1, 4) == 1) --  see mods/default/lua/apis/tree_growing
		end
	},
	planks = {
		name = "default:wood",
		description = "Wooden Planks",
		description_prefix = "Wooden",
		texture = "default_wood.png"
	},
})

default.register_tree("default:jungle", {
	description = "Jungle",
	schematic = core.get_modpath("default") .. "/schematics/jungle_tree_from_sapling.mts",
	schematic_size = {x = 2, y = 1, z = 2},
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
			if not default.can_grow() then
				return false
			end
			
			default.grow_jungle_tree(pos)
		end
	},
	planks = {
		name = "default:junglewood",
		description = "Junglewood Planks",
		description_prefix = "Junglewood",
		texture = "default_junglewood.png"
	},
})

default.register_tree("default:pine", {
	description = "Pine",
	texture_prefix = "default_pine",
	schematic = core.get_modpath("default") .. "/schematics/pine_tree_from_sapling.mts",
	schematic_size = {x = 2, y = 1, z = 2},
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
	},
})

default.register_tree("default:acacia", {
	description = "Acacia",
	texture_prefix = "default_acacia",
	schematic = core.get_modpath("default") .. "/schematics/acacia_tree_from_sapling.mts",
	schematic_size = {x = 4, y = 1, z = 4},
	sapling = {
		growtime = 420, -- 7 min -> in average 8.4 min
		growing_type = "schematic"
	},
})

default.register_tree("default:birch", {
	description = "Birch",
	texture_prefix = "default_birch",
	schematic = core.get_modpath("default") .. "/schematics/birch_tree_from_sapling.mts",
	schematic_size = {x = 2, y = 1, z = 2},
	sapling = {
		growtime = 420, -- 7 min -> in average 8.4 min
		growing_type = "schematic"
	},
})
