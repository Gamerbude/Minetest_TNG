
--
-- Waterlily
--

default.register_node("flowers:waterlily", {
	description = "Waterlily",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"flowers_waterlily.png"},
	inventory_image = "flowers_waterlily.png",
	wield_image = "flowers_waterlily.png",
	liquids_pointable = true,
	walkable = true,
	buildable_to = true,
	groups = {snappy = 3, flower = 1},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.46875, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}
	},

	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local find_water = minetest.find_nodes_in_area({x = pos.x - 1, y = pos.y, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y, z = pos.z + 1}, "default:water_source")
		local find_river_water = minetest.find_nodes_in_area({x = pos.x - 1, y = pos.y, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y, z = pos.z + 1}, "default:river_water_source")
		if #find_water ~= 0 then
			minetest.set_node(pos, {name = "default:water_source"})
			pos.y = pos.y + 1
			minetest.set_node(pos, {name = "flowers:waterlily", param2 = math.random(0, 3)})
		elseif #find_river_water ~= 0 then
			minetest.set_node(pos, {name = "default:river_water_source"})
			pos.y = pos.y + 1
			minetest.set_node(pos, {name = "flowers:waterlily", param2 = math.random(0, 3)})
		else
			minetest.remove_node(pos)
			return true
		end
	end
})
