-- mods/default/lua/functions.lua

-- dig upwards
function default.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = core.get_node(np)
	if nn.name == node.name then
		core.node_dig(np, nn, digger)
	end
end

-- Boolean whether it is day (04:48 to 19:19)
function default.is_day()
	local tod = core.get_timeofday()
	if tod > 0.2 and tod < 0.805 then
		return true
	end

	return false
end

-- schematic path
function default.get_schematic_path(modname, name)
	if not modname or not name then return end
	
	return core.get_modpath(modname) .. "/schematics/" .. name
end
