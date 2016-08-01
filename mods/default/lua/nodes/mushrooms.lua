-- mods/default/lua/nodes/mushrooms.lua
-- ====================================
-- See README.txt (in this mod) for licensing and other information.

default.register_node("default:mushroom_brown", {
	drawtype = "nodebox",
	description = "Brown Mushroom",
	tiles = {"flowers_mushroom_brown_top.png", "flowers_mushroom_brown_top.png", "flowers_mushroom_brown.png"},
	inventory_image = "flowers_mushroom_brown.png",
	wield_image = "flowers_mushroom_brown.png",
	node_box = default.node_box.mushroom_normal,
	selection_box = default.node_box.mushroom_select,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3,  flammable = 3, attached_node = 1, mushroom = 1}, -- mushroom=1 -> healthy mushroom; mushroom=2 -> unhealthy mushroom
	sounds = default.node_sound_leaves_defaults(),
	on_use = core.item_eat(1),
})

default.register_node("default:mushroom_red", {
	drawtype = "nodebox",
	description = "Red Mushroom",
	tiles = {"flowers_mushroom_red_top.png", "flowers_mushroom_red_top.png", "flowers_mushroom_red.png"},
	inventory_image = "flowers_mushroom_red.png",
	wield_image = "flowers_mushroom_red.png",
	node_box = default.node_box.mushroom_normal,
	selection_box = default.node_box.mushroom_select,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3,  flammable = 3, attached_node = 1, mushroom = 2},
	sounds = default.node_sound_leaves_defaults(),
	on_use = core.item_eat(-6),
})
