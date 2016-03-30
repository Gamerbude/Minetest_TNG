function default.register_wall(itemstring, def)
	if not def.groups then
		def.groups = {cracky = 3, wall = 1}
	end
	if not def.sounds then
		def.sounds = default.node_sound_stone_defaults()
	end
	
	default.register_node(itemstring, {
		description = def.description,
		tiles = def.tiles,
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
			connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
			connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
			connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
			connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
		},
		connects_to = {"group:cracky", "group:wall", "group:stone"},
		paramtype = "light",
		is_ground_content = false,
		groups = def.groups,
		sounds = def.sounds,
	})
	
	if not def.no_craft then
		core.register_craft({
			output = itemstring .. " 4",
			recipe = {
				{def.material, def.material, def.material},
				{def.material, def.material, def.material},
			}
		})
	end
end
