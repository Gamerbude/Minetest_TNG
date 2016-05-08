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

	def.groups.wood = 1

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

	default.register_node(name, def)
end

function default.register_sapling(name, def)
	local growtime = def.growtime or 300
	growtime = growtime * default.GROW_TIME_FACTOR
	local on_grow = def.on_grow
	
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
		if on_grow(pos) == false then
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

function default.register_tree_generation(def)
	def.deco_type = def.deco_type	or "schematic"
	def.flags = 	def.flags	or "place_center_x, place_center_z"
	def.place_on =	def.place_on	or {"default:dirt_with_grass"}
	def.y_min = 	def.y_min	or 1
	def.y_max = 	def.y_max	or 31000
	def.rotation = 	def.rotation	or "random"
	def.sidelen = 	def.sidelen	or 16
	
	core.register_decoration(def)
end

function default.register_tree(name, def)
	-- check that everything is defined
	def.log = def.log		or {}
	def.leaves = def.leaves		or {}
	def.sapling = def.sapling	or {}
	def.planks = def.planks		or {}
	def.mapgen = def.mapgen		or {}

	def.texture_prefix = def.texture_prefix or "default"


	-- get correct texture names
	-- textures will be as set, but if they're not set they'll be created with the texture_prefix
	def.log.tiles = def.log.tiles				or {def.texture_prefix .. "_tree_top.png", def.texture_prefix .. "_tree_top.png", def.texture_prefix .. "_tree.png"}
	def.leaves.texture = def.leaves.texture			or def.texture_prefix .. "_leaves.png"
	def.leaves.texture_simple = def.leaves.texture_simple	or def.texture_prefix .. "_leaves_simple.png"
	def.sapling.texture = def.sapling.texture		or def.texture_prefix .. "_sapling.png"
	def.planks.texture = def.planks.texture			or def.texture_prefix .. "_wood.png"


	-- if the descriptions aren't set they'll be created from the "main" description of the tree
	def.log.description = def.log.description			or def.description .. " Log"
	def.leaves.description = def.leaves.description			or def.description .. " Leaves"
	def.sapling.description = def.sapling.description		or def.description .. " Tree Sapling"
	def.planks.description = def.planks.description			or def.description .. " Wood Planks"
	def.planks.description_prefix = def.planks.description_prefix	or def.description .. " Wood"


	-- other values
	def.leaves.sapling_name = def.sapling.name	or name .. "_sapling"
	def.sapling.schematic = def.sapling.schematic	or def.schematic or nil
	def.mapgen.schematic = def.mapgen.schematic	or def.schematic or nil


	-- sapling growing functions
	if def.sapling.growing_type == "schematic" then
		default.grow_tree[name] = function(pos)
			if not default.can_grow(pos) then
				return false
			end
			
			core.log("action", "A \"" .. def.sapling.description .. "\" grows into a tree at " .. core.pos_to_string(pos))
			
			-- remove sapling
			core.remove_node(pos)

			-- place the schematic
			local path = def.sapling.schematic
			core.place_schematic({x = pos.x - def.sapling.schematic_size.x, y = pos.y - def.sapling.schematic_size.y, z = pos.z - def.sapling.schematic_size.z}, path, "random", def.sapling.schematic_replace or nil, false)
			
			return true
		end
		
		-- set the sapling growing function
		def.sapling.on_grow = default.grow_tree[name]
	
	elseif def.sapling.growing_type == "schematic_and_function" then
		default.grow_mgv6_tree[name] = def.sapling.mgv6_grow -- this function is only global because you maybe want to grow an old tree in a different mapgen than v6
		
		
		default.grow_tree[name] = function(pos) -- use this function if you ever want to have the right tree for the right mapgen
			if not default.can_grow(pos) then
				return false
			end
			
			local success = true
			
			core.log("action", "A \"" .. def.sapling.description .. "\" grows into a tree at " .. core.pos_to_string(pos))
			
			if core.get_mapgen_params().mgname == "v6" then
				-- grow tree with function
				success = default.grow_mgv6_tree[name](pos)
			else
				-- remove the sapling
				core.remove_node(pos)
				
				-- place schematic
				local path = def.sapling.schematic
				core.place_schematic({x = pos.x - def.sapling.schematic_size.x, y = pos.y - def.sapling.schematic_size.y, z = pos.z - def.sapling.schematic_size.z}, path, "random", def.sapling.schematic_replace or nil, false)
			end
			
			return success
		end
		
		-- set the sapling growing function
		def.sapling.on_grow = default.grow_tree[name]
	end

	-- log / tree
	if def.register.log == true then
		default.register_log(def.log.name or name .. "_tree", def.log)
	end
	
	-- leaves
	if def.register.leaves == true then
		default.register_leaves(def.leaves.name or name .. "_leaves", def.leaves)
	end
	
	-- sapling
	if def.register.sapling == true then
		default.register_sapling(def.sapling.name or name .. "_sapling", def.sapling)
	end
	
	-- planks / wood
	if def.register.planks == true then
		default.register_planks(def.planks.name or name .. "_wood", def.planks)
	end
	
	-- map generation
	if def.register.mapgen == true and core.get_mapgen_params().mgname ~= "v6" then -- dont register in mgv6
		default.register_tree_generation(def.mapgen)
	end
	
	
	if def.no_craft ~= true then
		core.register_craft({
			output = (def.planks.name or name .. "_wood") .. " 4",
			recipe = {
				{def.log.name or name .. "_tree"},
			},
		})
	end
end
