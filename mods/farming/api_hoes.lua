farming.hoe_on_use = function(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = core.get_node(pt.under)
	local p = {x = pt.under.x, y = pt.under.y + 1, z = pt.under.z}
	local above = core.get_node(p)

	-- return if any of the nodes is not registered
	if not core.registered_nodes[under.name] then
		return
	end
	if not core.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end

	-- check if pointing at soil
	if core.get_item_group(under.name, "soil") ~= 1 then
		return
	end

	-- check if (wet) soil defined
	local regN = core.registered_nodes
	if regN[under.name].soil == nil or regN[under.name].soil.wet == nil or regN[under.name].soil.dry == nil then
		return
	end

	if core.is_protected(pt.under, user:get_player_name()) then
		core.record_protection_violation(pt.under, user:get_player_name())
		return
	end
	if core.is_protected(pt.above, user:get_player_name()) then
		core.record_protection_violation(pt.above, user:get_player_name())
		return
	end


	-- turn the node into soil, wear out item and play sound
	core.set_node(pt.under, {name = regN[under.name].soil.dry})
	core.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})

	if not core.setting_getbool("creative_mode") then
		itemstack:add_wear(65535/(uses-1))
	end
	
	return itemstack
end

-- Register new hoes
farming.register_hoe = function(name, def)
	-- Check for : prefix (register new hoes in your mod's namespace)
	if name:sub(1, 1) ~= ":" then
		name = ":" .. name
	end

	local recipe = def.recipe or {
		{def.material or "air", def.material or "air"},
		{"",                   "group:stick"},
		{"",                   "group:stick"}
	}
	
	-- clean up
	def.material = nil
	def.recipe = nil
	
	
	-- Check def table
	def.description = def.description or "Hoe"
	def.inventory_image = def.inventory_image or "unknown_item.png"
	def.max_uses = def.max_uses or 30

	def.on_use = function(itemstack, user, pointed_thing)
		return farming.hoe_on_use(itemstack, user, pointed_thing, def.max_uses)
	end

	-- Register the tool
	core.register_tool(name, def)


	-- Register its recipe
	if not recipe or def.no_craft then
		core.register_craft({
			output = name:sub(2),
			recipe = recipe
		})
	end
end
