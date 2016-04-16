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
	noise_threshold = 0.0,
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
	noise_threshold = 0.0,
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
	noise_threshold = 0.0,
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
	noise_threshold = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

local stones = {
	{"stone"},
	{"sandstone"},
	{"desert_stone"}
}

for _,stone in pairs(stones) do
	stone = unpack(stone)
	-- Coal
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_coal",
		wherein        = "default:" .. stone,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 14,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = 64,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_coal",
		wherein        = "default:" .. stone,
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 32,
		clust_size     = 6,
		y_min          = -31000,
		y_max          = 0,
	})

	-- Iron
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_iron",
		wherein        = "default:" .. stone,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -15,
		y_max          = 2,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_iron",
		wherein        = "default:" .. stone,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -63,
		y_max          = -16,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_iron",
		wherein        = "default:" .. stone,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -64,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_iron",
		wherein        = "default:" .. stone,
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 27,
		clust_size     = 6,
		y_min          = -31000,
		y_max          = -64,
	})

	--Mese
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_mese",
		wherein        = "default:" .. stone,
		clust_scarcity = 26 * 26 * 26,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -255,
		y_max          = -64,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_mese",
		wherein        = "default:" .. stone,
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -256,
	})

	-- Gold
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_gold",
		wherein        = "default:" .. stone,
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -255,
		y_max          = -64,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_gold",
		wherein        = "default:" .. stone,
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -256,
	})

	-- Diamond
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_diamond",
		wherein        = "default:" .. stone,
		clust_scarcity = 22 * 22 * 22,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -255,
		y_max          = -128,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_diamond",
		wherein        = "default:" .. stone,
		clust_scarcity = 19 * 19 * 19,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -256,
	})
	
	-- Copper
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_copper",
		wherein        = "default:" .. stone,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -63,
		y_max          = -16,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:" .. stone .. "_with_copper",
		wherein        = "default:" .. stone,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -64,
	})
	
	-- Salt
	core.register_ore({
		ore_type       = "scatter",
		ore            =  "default:" .. stone .. "_with_salt",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 7,
		clust_size     = 3,
		y_min          = -79,
		y_max          = -32,
	})
	core.register_ore({
		ore_type       = "scatter",
		ore            =  "default:" .. stone .. "_with_salt",
		wherein        = "default:" .. stone,
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 9,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -80,
	})
end

-- Mese block
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 42 * 42 * 42,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -1024,
})
