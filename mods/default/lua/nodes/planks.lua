default.register_node("default:wood", {
	description = "Wooden Planks",
	tiles = {"default_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1, fuel = 8},
	sounds = default.node_sound_wood_defaults(),
	register = {stair = true, slab = true, table = true, fence = true, fencegate = true},
	stair = {
		legacy_alias = "stairs:stair_wood",
		description = "Wooden Stair",
	},
	slab = {
		legacy_alias = "stairs:slab_wood",
		description = "Wooden Slab",
	},
	fence = {
		description = "Wooden Fence",
	},
	fencegate = {
		description = "Wooden Fence Gate",
	},
	table = {
		description = "Wooden Table",
	},
})

default.register_node("default:junglewood", {
	description = "Junglewood Planks",
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1, fuel = 8},
	sounds = default.node_sound_wood_defaults(),
	register = {stair = true, slab = true, table = true, fence = true, fencegate = true},
	stair = {
		legacy_alias = "stairs:stair_junglewood"
	},
	slab = {
		legacy_alias = "stairs:slab_junglewood"
	},
	fence = {
		description =  "Junglewood Fence"
	},
	fencegate = {
		description = "Junglewood Fence Gate"
	},
	table = {
		description = "Junglewood Table",
	},
})

default.register_node("default:pine_wood", {
	description = "Pine Wood Planks",
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1, fuel = 8},
	sounds = default.node_sound_wood_defaults(),
	register = {stair = true, slab = true, table = true, fence = true, fencegate = true},
	stair = {
		legacy_alias = "stairs:stair_pine_wood"
	},
	slab = {
		legacy_alias = "stairs:slab_pine_wood"
	},
	fence = {
		description = "Pine Wood Fence"
	},
	fencegate = {
		description = "Pine Wood Fence Gate"
	},
	table = {
		description = "Pine Wood Table",
	},
})

default.register_node("default:acacia_wood", {
	description = "Acacia Wood Planks",
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1, fuel = 8},
	sounds = default.node_sound_wood_defaults(),
	register = {stair = true, slab = true, table = true, fence = true, fencegate = true},
	stair = {
		legacy_alias = "stairs:stair_acacia_wood"
	},
	slab = {
		legacy_alias = "stairs:slab_acacia_wood"
	},
	fence = {
		description = "Acacia Wood Fence"
	},
	fencegate = {
		description = "Acacia Wood Fence Gate"
	},
	table = {
		description = "Acacia Wood Table",
	},
})

default.register_node("default:birch_wood", {
	description = "Birch Wood Planks",
	tiles = {"default_birch_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
	register = {stair = true, slab = true, table = true, fence = true, fencegate = true},
	stair = {
		legacy_alias = "stairs:stair_birch_wood"
	},
	slab = {
		legacy_alias = "stairs:slab_birch_wood"
	},
	fence = {
		description = "Birch Wood Fence"
	},
	fencegate = {
		description = "Birch Wood Fence Gate"
	},
	table = {
		description = "Birch Wood Table",
	},
})
