function default.register_stair(name, def)
	if not def.groups then
		def.groups = {stair = 1}
	end
	
	def.drawtype = "mesh"
	def.mesh = "default_stair.obj"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
        def.stack_max = default.STACK_MAX
	if not core.setting_getbool("enable_stairs_mc_like") then
		def.selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5} 
			}
		}
	end
	def.collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5}
		}
	}
	def.on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = p1.x - placer_pos.x,
				y = p1.y - placer_pos.y,
				z = p1.z - placer_pos.z
			}
			param2 = minetest.dir_to_facedir(dir)
		end

		if p0.y - 1 == p1.y then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end

		return core.item_place(itemstack, placer, pointed_thing, param2)
	end
	
	-- register the node
	core.register_node(name, def)
	
	if not def.no_craft then
		core.register_craft({
			output = name .. " 6",
			recipe = {
				{def.material,      "",          ""      },
				{def.material, def.material,     ""      },
				{def.material, def.material, def.material}
			}
		})
		
		-- flipped recipe for the silly minecrafters
		core.register_craft({
			output = name .. " 6",
			recipe = {
				{     "",          "",       def.material},
				{     "",      def.material, def.material},
				{def.material, def.material, def.material}
			}
		})
	end
	
	local legacy = core.setting_getbool("enable_legacy_support") or true
	if def.legacy_alias and legacy then
		core.register_alias(def.legacy_alias, name)
	end
end