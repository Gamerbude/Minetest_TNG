-- This file is part of Minetest TNG
-- =================================
-- mods/farming/init.lua
-- 
-- See README.txt for licensing and other information.
-- 

farming = {}

local modpath = core.get_modpath("farming")

dofile(modpath .. "/api.lua")
dofile(modpath .. "/api_hoes.lua")
dofile(modpath .. "/plants.lua")
dofile(modpath .. "/soil.lua")
dofile(modpath .. "/hoes.lua")
dofile(modpath .. "/misc.lua")
dofile(modpath .. "/aliases.lua")
