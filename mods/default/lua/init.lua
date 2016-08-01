-- mods/default/lua/init.lua
-- =========================
-- See README.txt for licensing and other information.

-- File Paths
local modpath = core.get_modpath("default")
local luapath = modpath .. "/lua/"
local nodepath = modpath .. "/lua/nodes/"
local itempath = modpath .. "/lua/items/"
local mapgenpath = modpath .. "/lua/mapgen/"
local apipath = modpath .. "/lua/apis/"

local mg_name = core.get_mapgen_params().mgname or ""

--
-- Global Functions / Vars
--

dofile(luapath .. "gui.lua")
dofile(luapath .. "functions.lua")
dofile(luapath .. "register.lua")
dofile(luapath .. "environment.lua")
dofile(luapath .. "sounds.lua")
dofile(luapath .. "nodeboxes.lua")


--
-- Map Generation
--

dofile(mapgenpath .. "aliases.lua")
dofile(mapgenpath .. "ores.lua")
dofile(mapgenpath .. "nyancats.lua")
dofile(mapgenpath .. "ruins.lua")
if mg_name == "v6" then
	dofile(mapgenpath .. "mapgenv6.lua")
else
	dofile(mapgenpath .. "mapgenv57.lua")
end


--
-- APIs / Registration helpers
--

dofile(apipath .. "carpets.lua")
dofile(apipath .. "fences.lua")
dofile(apipath .. "fencegates.lua")
dofile(apipath .. "flowers.lua")
dofile(apipath .. "player.lua")
dofile(apipath .. "screwdriver.lua")
dofile(apipath .. "signs.lua")
dofile(apipath .. "slabs.lua")
dofile(apipath .. "stairs.lua")
dofile(apipath .. "tables.lua")
dofile(apipath .. "tree_growing.lua")
dofile(apipath .. "trees.lua")
dofile(apipath .. "walls.lua")


--
-- Nodes
--

-- full/natural/mapgen
dofile(nodepath .. "ores.lua")
dofile(nodepath .. "trees.lua")
-- ^ registers logs, leaves, saplings, planks (stair, salb, fences, ...)

dofile(nodepath .. "dirt.lua")
dofile(nodepath .. "sand.lua")
dofile(nodepath .. "gravel.lua")
dofile(nodepath .. "stone.lua")
dofile(nodepath .. "cobble.lua")

dofile(nodepath .. "ice.lua")
dofile(nodepath .. "snow.lua")

-- decoration
dofile(nodepath .. "wool.lua") -- also registers carpets

-- Plants
dofile(nodepath .. "grass.lua")
dofile(nodepath .. "flowers.lua")
dofile(nodepath .. "mushrooms.lua")
dofile(nodepath .. "mushroom_blocks.lua")
dofile(nodepath .. "waterlily.lua")

dofile(nodepath .. "papyrus.lua")
dofile(nodepath .. "cactus.lua")
dofile(nodepath .. "vines.lua")

-- Liquids
dofile(nodepath .. "water.lua")
dofile(nodepath .. "lava.lua")

-- Crafted
dofile(nodepath .. "glass.lua")
dofile(nodepath .. "bricks.lua")

-- Light
dofile(nodepath .. "torch.lua")
dofile(nodepath .. "lamps.lua")

-- Inventory blocks
dofile(nodepath .. "chests.lua")
dofile(nodepath .. "furnace.lua")
dofile(nodepath .. "bookshelf.lua")
dofile(nodepath .. "workbench.lua")

-- Nodes with special uses
dofile(nodepath .. "signs.lua")
dofile(nodepath .. "latter.lua")
dofile(nodepath .. "rails.lua")
dofile(nodepath .. "itemframes.lua")

-- Special
dofile(nodepath .. "food.lua")
dofile(nodepath .. "nyancat.lua")

dofile(nodepath .. "unused.lua")


--
-- Items
--

dofile(itempath .. "tools.lua")
dofile(itempath .. "weapons.lua")

dofile(itempath .. "food.lua")

dofile(itempath .. "books.lua")
dofile(itempath .. "materials.lua")
dofile(itempath .. "misc.lua")
dofile(itempath .. "bonemeal.lua")
dofile(itempath .. "craftguide.lua")

dofile(itempath .. "dyes.lua")


--
-- Crafting
--

dofile(luapath .. "crafting.lua")


--
-- Other Features
--

dofile(luapath .. "chat_cmds.lua")
dofile(luapath .. "death_msgs.lua")
dofile(luapath .. "item_pickup.lua")
dofile(luapath .. "item_physics.lua")
dofile(luapath .. "sethome.lua")
dofile(luapath .. "spectator_mode.lua")
dofile(luapath .. "no_sneak_glitch.lua")

if core.setting_getbool("creative_mode") then
	dofile(luapath .. "creative.lua")
end
