-- This file is part of Minetest TNG
-- =================================
-- mods/default/lua/init.lua
-- 
-- See README.txt for licensing and other information.

-- Global variables
default = {}
default.LIGHT_MAX = 14
default.STACK_MAX = core.setting_get("default_stack_max") or 100

-- default settings (for nodes, items)
core.craftitemdef_default.stack_max = default.STACK_MAX
core.nodedef_default.stack_max = default.STACK_MAX
core.noneitemdef_default.stack_max = default.STACK_MAX

-- Load files
local modpath = core.get_modpath("default")
local luapath = modpath .. "/lua/"
local mg_name = core.get_mapgen_params().mgname or ""


dofile(luapath .. "gui.lua")
dofile(luapath .. "functions.lua")
dofile(luapath .. "register.lua")
dofile(luapath .. "environment.lua")
dofile(luapath .. "sounds.lua")
-- APIs
dofile(luapath .. "apis/fences.lua")
dofile(luapath .. "apis/fencegates.lua")
dofile(luapath .. "apis/tables.lua")
dofile(luapath .. "apis/slabs.lua")
dofile(luapath .. "apis/stairs.lua")

-- Minetest-dev version content
if core.setting_getbool("enable_dev_content") then
	dofile(luapath .. "apis/walls.lua")
end

dofile(luapath .. "nodes.lua") -- loads files in ./nodes/
dofile(luapath .. "items.lua") -- loads files in ./items/
dofile(luapath .. "crafting.lua")
dofile(luapath .. "mapgen.lua")
if mg_name == "v6" then
	dofile(luapath .. "mapgenv6.lua")
elseif mg_name == "v5" or mg_name == "v7" then
	dofile(luapath .. "mapgenv57.lua")
end
dofile(luapath .. "chat_cmds.lua")
dofile(luapath .. "item_pickup.lua")
dofile(luapath .. "item_physics.lua")
dofile(luapath .. "trees.lua")
dofile(luapath .. "player.lua")
dofile(luapath .. "spectator_mode.lua")

dofile(luapath .. "aliases.lua")
dofile(luapath .. "legacy.lua")
