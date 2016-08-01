-- mods/default/lua/mapgenv6.lua
-- =============================
-- See README.txt (in this mod) for licensing and other information.

--
-- Register decorations
--

-- y?
core.clear_registered_decorations()

-- Papyrus
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 8,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 100, y = 100, z = 100},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	y_min = 1,
	y_max = 1,
	decoration = "default:papyrus",
	height = 2,
	height_max = 4,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- Cacti
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.012,
		scale = 0.024,
		spread = {x = 100, y = 100, z = 100},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:cactus",
	height = 3,
        height_max = 4,
})

-- Long grasses
for length = 1, 5 do
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:grass_"..length,
	})
end

-- Dry shrubs
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.035,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:dry_shrub",
})

-- Birch trees
core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.004,
		spread = {x = 100, y = 100, z = 100},
		seed = 2339,
		octaves = 3,
		persist = 0.6
	},
	y_min = 0,
	y_max = 30,
	schematic = core.get_modpath("default").."/schematics/birch_tree.mts",
	flags = "place_center_x, place_center_z",
})

-- Flowers
local function register_mgv6_flower(name)
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:flower_" .. name,
	})
end

register_mgv6_flower("rose")
register_mgv6_flower("tulip")
register_mgv6_flower("dandelion_yellow")
register_mgv6_flower("geranium")
register_mgv6_flower("viola")
register_mgv6_flower("dandelion_white")


-- Mushrooms
local function register_mgv6_mushroom(name)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.04,
			spread = {x = 100, y = 100, z = 100},
			seed = 7133,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:" .. name,
		spawn_by = "default:tree",
		num_spawn_by = 1,
	})
end

register_mgv6_mushroom("mushroom_brown")
register_mgv6_mushroom("mushroom_red")


-- Waterlily
core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.12,
		scale = 0.3,
		spread = {x = 100, y = 100, z = 100},
		seed = 33,
		octaves = 3,
		persist = 0.7
	},
	y_min = 0,
	y_max = 0,
	schematic = default.get_schematic_path("default", "waterlily.mts"),
	rotation = "random",
})

core.register_on_generated(default.generate_nyancats)
core.register_on_generated(default.generate_ruins)
