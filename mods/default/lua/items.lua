-- mods/default/lua/items.lua

local itempath = core.get_modpath("default") .. "/lua/items/"

dofile(itempath .. "tools.lua")
dofile(itempath .. "weapons.lua")

dofile(itempath .. "food.lua")

dofile(itempath .. "books.lua")
dofile(itempath .. "materials.lua")
dofile(itempath .. "misc.lua")
dofile(itempath .. "bonemeal.lua")
