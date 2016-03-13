local nodepath = minetest.get_modpath("default") .. "/nodes/"

dofile(nodepath .. "sounds.lua")

-- full/natural/mapgen
dofile(nodepath .. "ores.lua")
dofile(nodepath .. "leaves.lua")
dofile(nodepath .. "logs.lua")

dofile(nodepath .. "dirt.lua")
dofile(nodepath .. "sand.lua")
dofile(nodepath .. "gravel.lua")
dofile(nodepath .. "stone.lua")
dofile(nodepath .. "cobble.lua")

dofile(nodepath .. "ice.lua")
dofile(nodepath .. "snow.lua")


-- Plants
dofile(nodepath .. "grass.lua")
dofile(nodepath .. "papyrus.lua")
dofile(nodepath .. "saplings.lua")

dofile(nodepath .. "cactus.lua")


-- liquids
dofile(nodepath .. "water.lua")
dofile(nodepath .. "lava.lua")


-- crafted
dofile(nodepath .. "glass.lua")
dofile(nodepath .. "planks.lua")

dofile(nodepath .. "bricks.lua")


-- light
dofile(nodepath .. "torch.lua")
dofile(nodepath .. "lamps.lua")

-- blocks with an inventory
dofile(nodepath .. "chests.lua")
dofile(nodepath .. "furnace.lua")
dofile(nodepath .. "bookshelf.lua")

-- nodes with special functions
dofile(nodepath .. "signs.lua")
dofile(nodepath .. "fences.lua")
dofile(nodepath .. "latter.lua")
dofile(nodepath .. "rails.lua")
dofile(nodepath .. "itemframes.lua")
dofile(nodepath .. "tables.lua")

-- special
dofile(nodepath .. "food.lua")
dofile(nodepath .. "nyancat.lua")

dofile(nodepath .. "unused.lua")
