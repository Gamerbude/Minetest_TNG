--
-- Mushroom trees
--

-- Growing
function flowers.grow_brown_giant_mushroom(pos)
	local schematic = core.get_modpath("flowers") .. "/schematics/giant_mushroom_brown.mts"
	core.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2}, schematic, 0, {["flowers:mushroom_brown"] = "flowers:mushroom_tree_brown"}, false)
	core.swap_node(pos, {name="flowers:mushroom_tree_brown"})
end

function flowers.grow_red_giant_mushroom(pos)
	local schematic = core.get_modpath("flowers") .. "/schematics/giant_mushroom_red.mts"
	core.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2}, schematic, 0, {["flowers:mushroom_red"] = "flowers:mushroom_tree_red"}, false)
	core.swap_node(pos, {name="flowers:mushroom_tree_red"})
end


-- brown mushroom
default.register_node("flowers:mushroom_tree_brown", {
	description = "Brown Mushroom Trunk",
	tiles = {"flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_brown.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("flowers:mushroom_head_brown", {
	description = "Brown Mushroom Head",
	tiles = {"flowers_mushroom_head_brown.png", "flowers_mushroom_head_inner.png", "flowers_mushroom_head_brown.png" },
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = {
		items = {
			{items = {"flowers:mushroom_brown"}, max = 2, rarity = 2}
		}
	}
})

-- red mushroom
default.register_node("flowers:mushroom_tree_red", {
	description = "Red Mushroom Trunk",
	tiles = {"flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_red.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("flowers:mushroom_head_red", {
	description = "Red Mushroom Head",
	tiles = {"flowers_mushroom_head_red.png", "flowers_mushroom_head_inner.png", "flowers_mushroom_head_red.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = {
		items = {
			{items = {"flowers:mushroom_red"}, max = 2, rarity = 2},
		}
	}
})
