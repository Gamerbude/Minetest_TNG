-- mods/default/lua/item_pickup.lua

core.register_globalstep(function(dtime)
	for _,player in ipairs(core.get_connected_players()) do
		if player:get_hp() > 0 or not core.setting_getbool("enable_damage") then
			local pos = player:getpos()
			local controls = player:get_player_control()
			pos.y = pos.y+0.5
			local inv = player:get_inventory()
			local objcts1 = core.get_objects_inside_radius(pos, 1)
			local objcts2 = core.get_objects_inside_radius(pos, 2)
			for _,object in ipairs(objcts1) do
				if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
					if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) and controls.aux1 then
						inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
						if object:get_luaentity().itemstring ~= "" then
							core.sound_play("default_item_pickup", {
								to_player = player:get_player_name(),
								gain = 0.4*(1/#objcts1 or 1),
							})
						end
						object:get_luaentity().itemstring = ""
						object:remove()
					end
				end
			end
			
			for _,object in ipairs(objcts2) do
				if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
					if object:get_luaentity().collect then
						if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) and controls.aux1 then
							local pos1 = pos
							pos1.y = pos1.y+0.2
							local pos2 = object:getpos()
							local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
							vec.x = vec.x*3
							vec.y = vec.y*3
							vec.z = vec.z*3
							object:setvelocity(vec)
							object:get_luaentity().physical_state = false
							object:get_luaentity().object:set_properties({
								physical = false
							})
							-- TODO: is that necessary??
							core.after(1, function(args)
								local lua = object:get_luaentity()
								if object == nil or lua == nil or lua.itemstring == nil then
									return
								end
								if inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
									inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
									if object:get_luaentity().itemstring ~= "" then
										core.sound_play("default_item_pickup", {
											to_player = player:get_player_name(),
											gain = 0.4*(1/#objcts2 or 1),
										})
									end
									object:get_luaentity().itemstring = ""
									object:remove()
								else
									object:setvelocity({x=0,y=0,z=0})
									object:get_luaentity().physical_state = true
									object:get_luaentity().object:set_properties({
										physical = true
									})
								end
							end, {player, object})
							
						end
					end
				end
			end
		end
	end
end)

local item_drop = core.setting_getbool("enable_item_drop") or true
if item_drop then
	function core.handle_node_drops(pos, drops, digger)
		local inv
		if core.setting_getbool("creative_mode") and digger and digger:is_player() then
			inv = digger:get_inventory()
		end
		for _,item in ipairs(drops) do
			local count, name
			if type(item) == "string" then
				count = 1
				name = item
			else
				count = item:get_count()
				name = item:get_name()
			end
			if not inv or not inv:contains_item("main", ItemStack(name)) then
				for i=1,count do
					local obj = core.add_item(pos, name)
					if obj ~= nil then
						obj:get_luaentity().collect = true
						local x = math.random(1, 5)
						if math.random(1,2) == 1 then
							x = -x
						end
						local z = math.random(1, 5)
						if math.random(1,2) == 1 then
							z = -z
						end
						obj:setvelocity({x=1/x, y=obj:getvelocity().y, z=1/z})

						-- FIXME this doesnt work for deactiveted objects
						if core.setting_get("remove_items") and tonumber(core.setting_get("remove_items")) then
							core.after(tonumber(core.setting_get("remove_items")), function(obj)
								obj:remove()
							end, obj)
						end
					end
				end
			end
		end
	end
end
