-- mods/default/init.lua
-- =====================
-- See README.txt for licensing and other information.

default = {}

function default.get_difficult_and_set(easy, normal, hard)
	local difficults = {}
	difficults["easy"] = easy
	difficults["normal"] = normal
	difficults["hard"] = hard
	return difficults[core.setting_get("difficulty") or "normal"]
end

-- Global variables
default.NAME = "tng"
default.LIGHT_MAX = 14
default.STACK_MAX = core.setting_get("default_stack_max") or 100
default.GROW_TIME_FACTOR = default.get_difficult_and_set(0.8, 1.0, 1.4)

-- default settings (for nodes, items)
core.craftitemdef_default.stack_max =  default.STACK_MAX
core.nodedef_default.stack_max =       default.STACK_MAX
core.noneitemdef_default.stack_max =   default.STACK_MAX


-- Filepaths
local modpath = core.get_modpath("default")
local luapath = modpath .. "/lua/"
local nodepath = modpath .. "/lua/nodes/"
local itempath = modpath .. "/lua/items/"
local mapgenpath = modpath .. "/lua/mapgen/"
local apipath = modpath .. "/lua/apis/"
local envpath = modpath .. "/lua/environment/"
local miscpath = modpath .. "/lua/misc/"

local mg_name = core.get_mapgen_params().mgname or ""

--
-- Global Functions
--

dofile(miscpath .. "gui.lua")
dofile(luapath .. "functions.lua")
dofile(luapath .. "register.lua")


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
-- Environment
--

-- Growing
dofile(envpath .. "grow_cactus.lua")
dofile(envpath .. "grow_grass.lua")
dofile(envpath .. "grow_papyrus.lua")

-- Items
dofile(envpath .. "item_physics.lua")
dofile(envpath .. "item_pickup.lua")

-- Misc
dofile(envpath .. "lava_cooling.lua")
dofile(envpath .. "leafdecay.lua")
dofile(envpath .. "no_sneak_glitch.lua")
dofile(envpath .. "sethome.lua")
dofile(envpath .. "sounds.lua")
-- torch wield light (optional)
if core.is_yes(core.setting_get("enable_torches_wieldlight") or false) then
	dofile(envpath .. "torch_wield_light.lua")
end


--
-- APIs
--

-- Misc
dofile(apipath .. "player.lua")
dofile(apipath .. "screwdriver.lua")

-- Nodes
dofile(apipath .. "carpets.lua")
dofile(apipath .. "fences.lua")
dofile(apipath .. "fencegates.lua")
dofile(apipath .. "signs.lua")
dofile(apipath .. "slabs.lua")
dofile(apipath .. "stairs.lua")
dofile(apipath .. "furniture.lua") -- for chairs and tables
dofile(apipath .. "walls.lua")

-- tree api growing + nodes
dofile(apipath .. "tree_growing.lua")
dofile(apipath .. "trees.lua")


--
-- Nodes (inculdes crafting recipes)
--

-- Full/Natural/Terrain
dofile(nodepath .. "ores.lua")
dofile(nodepath .. "trees.lua") -- registers logs, leaves, saplings, planks (stair, salb, fences, ...)

dofile(nodepath .. "dirt.lua")
dofile(nodepath .. "sand.lua")
dofile(nodepath .. "gravel.lua")
dofile(nodepath .. "stone.lua")
dofile(nodepath .. "cobble.lua")

dofile(nodepath .. "ice.lua")
dofile(nodepath .. "snow.lua")

dofile(nodepath .. "wool.lua") -- also registers carpets

-- Plants
dofile(nodepath .. "grass.lua")
dofile(nodepath .. "papyrus.lua")

dofile(nodepath .. "cactus.lua")
dofile(nodepath .. "vines.lua")

-- Liquids
dofile(nodepath .. "water.lua")
dofile(nodepath .. "lava.lua")

-- Crafted
dofile(nodepath .. "glass.lua")
dofile(nodepath .. "bricks.lua")
dofile(nodepath .. "walls.lua")



-- Light
dofile(nodepath .. "torch.lua")
dofile(nodepath .. "lamps.lua")

-- Inventory Nodes
dofile(nodepath .. "chests.lua")
dofile(nodepath .. "furnace.lua")
dofile(nodepath .. "bookshelf.lua")
dofile(nodepath .. "workbench.lua")

-- Functional Nodes
dofile(nodepath .. "signs.lua")
dofile(nodepath .. "ladder.lua")
dofile(nodepath .. "rails.lua")
dofile(nodepath .. "itemframes.lua")

-- Misc
dofile(nodepath .. "chessboard.lua")
dofile(nodepath .. "food.lua")
dofile(nodepath .. "nyancat.lua")

dofile(nodepath .. "unused.lua")


--
-- Items (inculdes crafting recipes)
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
-- Misc
--

dofile(miscpath .. "chat_cmds.lua")
dofile(miscpath .. "death_msgs.lua")
dofile(miscpath .. "spectator_mode.lua")
dofile(miscpath .. "give_initial_stuff.lua")

if core.setting_getbool("creative_mode") then
	dofile(miscpath .. "creative.lua")
end
