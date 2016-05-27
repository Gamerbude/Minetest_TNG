-- mods/farming/init.lua
farming = {}

local modpath = core.get_modpath("farming")

dofile(modpath .. "/api.lua")
dofile(modpath .. "/plants.lua")
dofile(modpath .. "/soil.lua")
dofile(modpath .. "/misc.lua")
dofile(modpath .. "/aliases.lua")
