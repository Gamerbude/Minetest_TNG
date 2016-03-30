function default.register_fencegate(name, def)
	def.drawtype = "mesh"
	def.tiles = def.tiles or {def.texture}
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.sunlight_propagates = true
	def.is_ground_content = false
        def.stack_max = default.STACK_MAX
	def.drop = name .. "_closed"
	def.connect_sides = {"left", "right"}
	def.on_rightclick = function(pos)
		local node = core.get_node(pos)
		local node_def = core.registered_nodes[node.name]
		
		core.swap_node(pos, {name = node_def.gate, param2 = node.param2})
		core.sound_play(node_def.sound, {pos = pos, gain = 0.3, max_hear_distance = 8})
	end
	def.selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/4, 1/2, 1/2, 1/4},
	}
	if not def.groups then
		def.groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fuel = 16}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end
	def.groups.fence = 1
	def.groups.fencegate = 1
	
        
	-- copy and make changes for the closed and for the open fencegate def
	local gate_closed = table.copy(def)
	local gate_open = table.copy(def)
	
	gate_closed.mesh = "default_fencegate_closed.obj"
	gate_closed.gate = name .. "_open"
	gate_closed.sound = def.sound_open or "default_fencegate_open"
	gate_closed.collision_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/4, 1/2, 1/2, 1/4},
	}

	gate_open.mesh = "default_fencegate_open.obj"
	gate_open.gate = name .. "_closed"
	gate_open.sound = def.sound_close or "default_fencegate_close"
	gate_open.groups.not_in_creative_inventory = 1
	gate_open.collision_box = {
		type = "fixed",
		fixed = {{-1/2, -1/2, -1/4, -3/8, 1/2, 1/4},
			{-5/8, -3/8, -14/16, -3/8, 3/8, 0}},
	}
	
	-- clean up vars.
	gate_closed.texture = nil
	gate_closed.material = nil
	gate_closed.sound_open = nil
	gate_closed.sound_close = nil
	gate_open.texture = nil
	gate_open.material = nil
	gate_open.sound_open = nil
	gate_open.sound_close = nil

	-- register closed and open fencegate nodes
	core.register_node(":" .. name .. "_closed", gate_closed)
	core.register_node(":" .. name .. "_open", gate_open)
	
	-- register an alias for easier use of /give and /giveme
	core.register_alias(name, name .. "_closed")
	
	if not def.no_craft then
		core.register_craft({
			output = name .. "_closed",
			recipe = {
				{"group:stick", def.material, "group:stick"},
				{"group:stick", def.material, "group:stick"}
			}
		})
	end
end
