-- mods/default/lua/mapgen.lua

--
-- Aliases for map generator outputs
--

core.register_alias("mapgen_air", "air")
core.register_alias("mapgen_stone", "default:stone")
core.register_alias("mapgen_dirt", "default:dirt")
core.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
core.register_alias("mapgen_sand", "default:sand")
core.register_alias("mapgen_water_source", "default:water_source")
core.register_alias("mapgen_river_water_source", "default:water_source")
core.register_alias("mapgen_lava_source", "default:lava_source")
core.register_alias("mapgen_gravel", "default:gravel")
core.register_alias("mapgen_desert_stone", "default:desert_stone")
core.register_alias("mapgen_desert_sand", "default:desert_sand")
core.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
core.register_alias("mapgen_snowblock", "default:snowblock")
core.register_alias("mapgen_snow", "default:snow")
core.register_alias("mapgen_ice", "default:ice")
core.register_alias("mapgen_sandstone", "default:sandstone")

-- Flora

core.register_alias("mapgen_tree", "default:tree")
core.register_alias("mapgen_leaves", "default:leaves")
core.register_alias("mapgen_apple", "default:leaves_with_apple")
core.register_alias("mapgen_jungletree", "default:jungletree")
core.register_alias("mapgen_jungleleaves", "default:jungleleaves")
core.register_alias("mapgen_junglegrass", "default:junglegrass")
core.register_alias("mapgen_pine_tree", "default:pine_tree")
core.register_alias("mapgen_pine_needles", "default:pine_needles")

-- Dungeons

core.register_alias("mapgen_cobble", "default:cobble")
core.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
core.register_alias("mapgen_mossycobble", "default:mossycobble")
core.register_alias("mapgen_sandstonebrick", "default:sandstonebrick")
core.register_alias("mapgen_stair_sandstonebrick", "stairs:stair_sandstonebrick")


--
-- Register ores
--

-- Blob ore first to avoid other ores inside blobs

-- Clay
core.register_ore({ 
	ore_type         = "blob",
	ore              = "default:clay",
	wherein          = {"default:sand"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -15,
	y_max            = 0,
	noise_threshhold = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -316,
		octaves = 1,
	persist = 0.0
	},
})

-- Sand
core.register_ore({ 
	ore_type         = "blob",
	ore              = "default:sand",
	wherein          = {"default:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 4,
	noise_threshhold = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 2316,
		octaves = 1,
		persist = 0.0
	},
})

-- Dirt
core.register_ore({
	ore_type         = "blob",
	ore              = "default:dirt",
	wherein          = {"default:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 31000,
	noise_threshhold = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 17676,
		octaves = 1,
		persist = 0.0
	},
})

-- Gravel
core.register_ore({
	ore_type         = "blob",
	ore              = "default:gravel",
	wherein          = {"default:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31000,
	y_max            = 31000,
	noise_threshhold = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

-- Coal
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = 64,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min          = -31000,
	y_max          = 0,
})

-- Iron
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -15,
	y_max          = 2,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -63,
	y_max          = -16,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 7 * 7 * 7,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -64,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min          = -31000,
	y_max          = -64,
})

--Mese
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = "default:stone",
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -255,
	y_max          = -64,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = "default:stone",
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -256,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 36 * 36 * 36,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -1024,
})

-- Gold
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -255,
	y_max          = -64,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 13 * 13 * 13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -256,
})

-- Diamond
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 17 * 17 * 17,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = -255,
	y_max          = -128,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -256,
})

-- Copper
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = -63,
	y_max          = -16,
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -64,
})


function default.make_nyancat(pos, facedir, length)
	local tailvec = {x = 0, y = 0, z = 0}
	if facedir == 0 then
		tailvec.z = 1
	elseif facedir == 1 then
		tailvec.x = 1
	elseif facedir == 2 then
		tailvec.z = -1
	elseif facedir == 3 then
		tailvec.x = -1
	else
		facedir = 0
		tailvec.z = 1
	end
	local p = {x = pos.x, y = pos.y, z = pos.z}
	core.set_node(p, {name = "default:nyancat", param2 = facedir})
	for i = 1, length do
		p.x = p.x + tailvec.x
		p.z = p.z + tailvec.z
		core.set_node(p, {name = "default:nyancat_rainbow", param2 = facedir})
	end
end


--
-- Generate nyan cats
--

function default.generate_nyancats(minp, maxp, seed)
	local height_min = -31000
	local height_max = -32
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_nyancats = math.floor(volume / (16 * 16 * 16))
	for i = 1, max_num_nyancats do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			default.make_nyancat(p0, pr:next(0, 3), pr:next(3, 15))
		end
	end
end
