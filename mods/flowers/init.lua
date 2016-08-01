-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.


-- Namespace for functions

flowers = {}

local modpath = core.get_modpath("flowers")

-- Map Generation
dofile(modpath .. "/mapgen.lua")

-- Flora
dofile(modpath ..  "/flowers.lua")
dofile(modpath ..  "/mushrooms.lua")
dofile(modpath ..  "/waterlily.lua")






