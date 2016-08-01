-- mods/default/lua/nodes/flowers.lua
-- ==================================
-- See README.txt (in this mod) for licensing and other information.

-- Flowers API: mods/default/lua/apis/flowers.lua

default.register_flower("default:flower_rose", {
	description = "Rose",
	texture = "flowers_rose.png", -- will be used for inventory, wield, tile image
	groups = {color_red = 1}, -- other groups will be automatically added
	selection_box = default.node_box.flower_high -- using special selection_box
})

default.register_flower("default:flower_tulip", {
	description = "Orange Tulip",
	texture = "flowers_tulip.png",
	groups = {color_orange = 1}
	-- using default selection_box, no need to define
})

default.register_flower("default:flower_dandelion_yellow", {
	description = "Yellow Dandelion",
	texture = "flowers_dandelion_yellow.png",
	groups = {color_yellow = 1}
})

default.register_flower("default:flower_geranium", {
	description = "Blue Geranium",
	texture = "flowers_dandelion_yellow.png",
	groups = {color_blue = 1}
})

default.register_flower("default:flower_viola", {
	description = "Viola",
	texture = "flowers_viola.png",
	groups = {color_violet = 1},
	selection_box = default.node_box.flower_wide,
})

default.register_flower("default:flower_dandelion_white", {
	description = "White Dandelion",
	texture = "flowers_dandelion_white.png",
	groups = {color_white = 1},
	selection_box = default.node_box.flower_wide,
})
