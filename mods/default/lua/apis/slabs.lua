function default.register_slab(name, def)
	if not def.groups then
		def.groups = {slab = 1}
	end
	
	def.drawtype = "nodebox"
	def.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	}
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
        def.stack_max = default.STACK_MAX
	def.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	}
	def.collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	}
	def.on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		-- If it's being placed on an another similar one, replace it with
		-- a full block
		local slabpos = nil
		local slabnode = nil
		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local n0 = core.get_node(p0)
		local n1 = core.get_node(p1)
		local param2 = 0

		local n0_is_upside_down = (n0.name == def.name and n0.param2 >= 20)

		if n0.name == def.name and not n0_is_upside_down and p0.y + 1 == p1.y then
			slabpos = p0
			slabnode = n0
		elseif n1.name == def.name then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			core.remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(def.material)
			fakestack:set_count(itemstack:get_count())

			pointed_thing.above = slabpos
			local success
			fakestack, success = core.item_place(fakestack, placer, pointed_thing)
			
			-- If the item was taken from the fake stack, decrement original
			if success then
				itemstack:set_count(fakestack:get_count())
			-- Else put old node back
			else
				core.set_node(slabpos, slabnode)
			end
			return itemstack
		end

		-- Upside down slabs
		if p0.y - 1 == p1.y then
			-- Turn into full block if pointing at a existing slab
			if n0_is_upside_down  then
				-- Remove the slab at the position of the slab
				core.remove_node(p0)

				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(def.material)
				fakestack:set_count(itemstack:get_count())

				pointed_thing.above = p0
				local success
				fakestack, success = core.item_place(fakestack, placer, pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if success then
					itemstack:set_count(fakestack:get_count())
				-- Else put old node back
				else
					core.set_node(p0, n0)
				end
				return itemstack
			end

			-- Place upside down slab
			param2 = 20
		end

		-- If pointing at the side of a upside down slab
		if n0_is_upside_down and p0.y + 1 ~= p1.y then
			param2 = 20
		end

		return core.item_place(itemstack, placer, pointed_thing, param2)
	end
	
	-- register the node
	core.register_node(name, def)
	
	if not def.no_craft then
		core.register_craft({
			output = name .. " 6",
			recipe = {
				{def.material, def.material, def.material}
			}
		})
	end
	
	local legacy = core.setting_getbool("enable_legacy_support") or true
	if def.legacy_alias and legacy then
		core.register_alias(def.legacy_alias, name)
	end
end