local itemframe = {}

minetest.register_entity("default:itemframe_item",{
	hp_max = 1,
	visual = "wielditem",
	visual_size = {x = 0.33, y = 0.33},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)
		if itemframe.nodename ~= nil and itemframe.texture ~= nil then
			self.nodename = itemframe.nodename
			itemframe.nodename = nil
			self.texture = itemframe.texture
			itemframe.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(";")
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ";" .. self.texture
		end
		return
	end
})


local facedir = {}
facedir[0] = {x = 0, y = 0, z = 1}
facedir[1] = {x = 1, y = 0, z = 0}
facedir[2] = {x = 0, y = 0, z = -1}
facedir[3] = {x = -1, y = 0, z= 0}

local remove_item = function(pos, node)
	local objs = nil
	if node.name == "default:itemframe" then
		objs = minetest.get_objects_inside_radius(pos, .5)
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "default:itemframe_item" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)
	remove_item(pos, node)
	local meta = minetest.env:get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "default:itemframe" then
			local posad = facedir[node.param2]
			if not posad then return end
			pos.x = pos.x + posad.x*6.5/16
			pos.y = pos.y + posad.y*6.5/16
			pos.z = pos.z + posad.z*6.5/16
		elseif node.name == "itemframes:pedestal" then
			pos.y = pos.y + 12/16+.33
		end
		itemframe.nodename = node.name
		itemframe.texture = ItemStack(meta:get_string("item")):get_name()
		local e = minetest.env:add_entity(pos,"default:itemframe_item")
		if node.name == "default:itemframe" then
			local yaw = math.pi*2 - node.param2 * math.pi/2
			e:setyaw(yaw)
		end
	end
end

local drop_item = function(pos, node)
	local meta = minetest.get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "default:itemframe" then
			minetest.add_item(pos, meta:get_string("item"))
		end
		meta:set_string("item", "")
	end
	remove_item(pos, node)
end

default.register_node("default:itemframe",{
	description = "Item frame",
	drawtype = "nodebox",
	node_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
	selection_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
	tiles = {"default_itemframe.png"},
	inventory_image = "default_itemframe.png",
	wield_image = "default_itemframe.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {choppy=2, dig_immediate=2, flammable = 2, fuel = 4},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		if not itemstack then return end
		
		local meta = minetest.get_meta(pos)
		drop_item(pos,node)
		
		local name = itemstack
		meta:set_string("item", name:to_string())
		
		update_item(pos,node)
		
		if not core.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		
		return itemstack
	end,
	on_punch = function(pos, node)
		drop_item(pos, node)
	end
})

--[[
-- automatically restore entities lost from frames
-- due to /clearobjects or similar

minetest.register_abm({
	nodenames = { "default:itemframe" },
	interval = 15,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if #minetest.get_objects_inside_radius(pos, 0.5) > 0 then return end
		update_item(pos, node)
	end
})
--]]
