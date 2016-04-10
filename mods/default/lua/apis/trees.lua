function default.register_planks(name, def)
	def.register = def.register or {stair = true, slab = true, table = true, fence = true, fencegate = true}
	def.groups = def.groups or {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1, fuel = 8}
	def.sounds = def.sounds or default.node_sound_wood_defaults()
	def.tiles = def.tiles or {def.texture}
	def.is_ground_content = false
	def.stair = def.stair or {description = def.description_prefix .. " Stair"}
	def.slab = def.slab or {description = def.description_prefix .. " Slab"}
	def.table = def.table or {description = def.description_prefix .. " Table"}
	def.fence = def.fence or {description = def.description_prefix .. " Fence"}
	def.fencegate = def.fencegate or {description = def.description_prefix .. " Fence Gate"}

	-- clean up vars
	def.description_prefix = nil
	def.name = nil
	def.texture = nil

	default.register_node(name, def)
end

function default.register_leaves(name, def)
	def.drawtype = "allfaces_optional"
	def.waving = 1
	def.visual_scale = 1.3
	def.tiles = def.tiles or {def.texture}
	def.special_tiles = def.special_tiles or {def.special_texture}
	def.paramtype = "light"
	def.is_ground_content = false
	def.after_place_node = default.after_place_leaves
	def.groups = def.groups or {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, fuel = 2}
	def.sounds = def.sounds or default.node_sound_leaves_defaults()
	def.drop = def.drop or {
		max_items = 1,
		items = {
			{items = {def.sapling_name}, rarity = def.sapling_rarity or 20},
			{items = {name}}
		}
	}

	-- clean up vars
	def.sapling_name = nil
	def.sapling_rarity = nil
	def.name = nil
	def.texture = nil
	def.special_texture = nil

	default.register_node(name, def)
end

function default.register_log(name, def)
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.groups = def.groups or {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, fuel = 32}
	def.sounds = def.sounds or default.node_sound_wood_defaults()
	def.on_place = core.rotate_node

	-- clean up vars
	def.name = nil
	def.texture = nil

	default.register_node(name, def)
end

function default.register_sapling(name, def)
	local growtime = def.growtime or 300
	growtime = growtime * default.GROW_TIME_FACTOR
	local on_grow = def.on_grow or default.grow_sapling
	
	def.drawtype = "plantlike"
	def.tiles = def.tiles or {def.texture}
	def.inventory_image = def.texture or def.tiles[1]
	def.wield_image = def.texture or def.tiles[1]
	def.paramtype = "light"
	def.sunlight_propagates = true
	def.walkable = false
	def.groups = def.groups or {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1}
	def.sounds = def.sounds or default.node_sound_leaves_defaults()
	def.on_construct = function(pos)
		local timer = core.get_node_timer(pos)
		timer:start(math.random(growtime * 0.6, growtime * 1.8))
	end
	def.on_timer = function(pos, elapsed)
		if on_grow(pos, core.get_node(pos)) == false then
			-- if the grow failed then retry after shorter time
			core.get_node_timer(pos):start(math.random(growtime * 0.3, growtime * 0.5))
		end
	end
	def.selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	}
	
	def.growtime = nil
	def.texture = nil
	def.on_grow = nil
	
	default.register_node(name, def)
end

function default.register_tree(name, def)
	-- log / tree
	def.log.description = def.log.description or def.description .. " Log"
	default.register_log(def.log.name or name .. "_tree", def.log)

	-- planks / wood
	def.planks.description = def.planks.description or def.description .. " Wood Planks"
	def.planks.description_prefix = def.planks.description_prefix or def.description .. " Wood"
	default.register_planks(def.planks.name or name .. "_wood", def.planks)

	-- leaves
	def.leaves.sapling_name = def.sapling.name or name .. "_sapling"
	def.leaves.description = def.leaves.description or def.description .. " Leaves"
	default.register_leaves(def.leaves.name or name .. "_leaves", def.leaves)

	-- sapling
	def.sapling.description = def.sapling.description or def.description .. " Tree Sapling"
	default.register_sapling(def.sapling.name or name .. "_sapling", def.sapling)
end
