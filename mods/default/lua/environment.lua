-- mods/default/lua/environment.lua

--
-- Lavacooling
--

default.cool_lava_source = function(pos)
	core.set_node(pos, {name = "default:obsidian"})
	core.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

default.cool_lava_flowing = function(pos)
	core.set_node(pos, {name = "default:stone"})
	core.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

core.register_abm({
	nodenames = {"default:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	action = function(...)
		default.cool_lava_flowing(...)
	end,
})

core.register_abm({
	nodenames = {"default:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	action = function(...)
		default.cool_lava_source(...)
	end,
})


--
-- Growing
--

-- Grass
core.register_abm({
	nodenames = {"default:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light") and
				nodedef.liquidtype == "none" and
				(core.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				core.set_node(pos, {name = "default:dirt_with_snow"})
			else
				core.set_node(pos, {name = "default:dirt_with_grass"})
			end
		end
	end
})

-- Remove grass
core.register_abm({
	nodenames = {"default:dirt_with_grass", "default:dirt_with_dry_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			core.set_node(pos, {name = "default:dirt"})
		end
	end
})


-- Cactus
function default.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if core.get_item_group(core.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = core.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	core.set_node(pos, {name = "default:cactus"})
	return true
end

core.register_abm({
	nodenames = {"default:cactus"},
	neighbors = {"group:sand"},
	interval = 50,
	chance = 20,
	action = function(...)
		default.grow_cactus(...)
	end
})


-- Papyrus
function default.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	local name = core.get_node(pos).name
	if name ~= "default:dirt_with_grass" and name ~= "default:dirt" then
		return
	end
	if not core.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = core.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	core.set_node(pos, {name = "default:papyrus"})
	return true
end

core.register_abm({
	nodenames = {"default:papyrus"},
	neighbors = {"default:dirt", "default:dirt_with_grass", "default:sand"},
	interval = 50,
	chance = 20,
	action = function(...)
		default.grow_papyrus(...)
	end
})


--
-- Leafdecay
--

default.leafdecay_trunk_cache = {}
default.leafdecay_enable_cache = true
-- Spread the load of finding trunks
default.leafdecay_trunk_find_allow_accumulator = 0

core.register_globalstep(function(dtime)
	local finds_per_second = 5000
	default.leafdecay_trunk_find_allow_accumulator =
			math.floor(dtime * finds_per_second)
end)

default.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	local node = core.get_node(pos)
	node.param2 = 1
	core.set_node(pos, node)
end

core.register_abm({
	nodenames = {"group:leafdecay"},
	neighbors = {"air", "group:liquid"},
	-- A low interval and a high inverse chance spreads the load
	interval = 2,
	chance = 5,

	action = function(p0, node, _, _)
		local do_preserve = false
		local d = core.registered_nodes[node.name].groups.leafdecay
		if not d or d == 0 then
			--print("not groups.leafdecay")
			return
		end
		local n0 = core.get_node(p0)
		if n0.param2 ~= 0 then
			return
		end
		local p0_hash = nil
		if default.leafdecay_enable_cache then
			p0_hash = core.hash_node_position(p0)
			local trunkp = default.leafdecay_trunk_cache[p0_hash]
			if trunkp then
				local n = core.get_node(trunkp)
				local reg = core.registered_nodes[n.name]
				-- Assume ignore is a trunk, to make the thing
				-- work at the border of the active area
				if n.name == "ignore" or (reg and reg.groups.tree and
						reg.groups.tree ~= 0) then
					return
				end
				-- Cache is invalid
				table.remove(default.leafdecay_trunk_cache, p0_hash)
			end
		end
		if default.leafdecay_trunk_find_allow_accumulator <= 0 then
			return
		end
		default.leafdecay_trunk_find_allow_accumulator =
				default.leafdecay_trunk_find_allow_accumulator - 1
		-- Assume ignore is a trunk, to make the thing
		-- work at the border of the active area
		local p1 = core.find_node_near(p0, d, {"ignore", "group:tree"})
		if p1 then
			do_preserve = true
			if default.leafdecay_enable_cache then
				-- Cache the trunk
				default.leafdecay_trunk_cache[p0_hash] = p1
			end
		end
		if not do_preserve then
			-- Drop stuff other than the node itself
			local itemstacks = core.get_node_drops(n0.name)
			for _, itemname in ipairs(itemstacks) do
				if core.get_item_group(n0.name, "leafdecay_drop") ~= 0 or
						itemname ~= n0.name then
					local p_drop = {
						x = p0.x - 0.5 + math.random(),
						y = p0.y - 0.5 + math.random(),
						z = p0.z - 0.5 + math.random(),
					}
					core.add_item(p_drop, itemname)
				end
			end
			-- Remove node
			core.remove_node(p0)
			nodeupdate(p0)
		end
	end
})
