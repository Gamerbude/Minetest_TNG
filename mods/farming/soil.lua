core.override_item("default:dirt", {
	groups = {crumbly = 3, soil = 1},
	soil = {
		base = "default:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

core.override_item("default:dirt_with_grass", {
	groups = {crumbly = 3, soil = 1},
	soil = {
		base = "default:dirt_with_grass",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

default.register_node("farming:soil", {
	description = "Soil",
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "default:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

default.register_node("farming:soil_wet", {
	description = "Wet Soil",
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "default:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

default.register_node("farming:garden_soil", {
	description = "Garden Soil",
	tiles = {"farming_garden_soil.png"},
	groups = {crumbly = 2, soil = 3, wet = 1, grassland = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.override_item("default:desert_sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1, soil = 1},
	soil = {
		base = "default:desert_sand",
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})
default.register_node("farming:desert_sand_soil", {
	description = "Desert Sand Soil",
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil.png", "default_desert_sand.png"},
	groups = {crumbly = 3, not_in_creative_inventory = 1, falling_node=1, sand=1, soil = 2, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
	soil = {
		base = "default:desert_sand",
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})

default.register_node("farming:desert_sand_soil_wet", {
	description = "Wet Desert Sand Soil",
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1, not_in_creative_inventory = 1, soil = 3, wet = 1, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
	soil = {
		base = "default:desert_sand",
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})

core.register_abm({
	nodenames = {"group:field"},
	interval = 15,
	chance = 4,
	action = function(pos, node)
		local n_def = core.registered_nodes[node.name] or nil
		if not n_def or not n_def.soil or not n_def.soil.wet or not n_def.soil.base or not n_def.soil.dry then
			return
		end

		local wet = n_def.soil.wet
		local base = n_def.soil.base
		local dry = n_def.soil.dry

		pos.y = pos.y + 1
		local nn = core.get_node_or_nil(pos)
		if not nn or not nn.name then
			return
		end
		local nn_def = core.registered_nodes[nn.name] or nil
		pos.y = pos.y - 1
		
		if nn_def and nn_def.walkable and core.get_item_group(nn.name, "plant") == 0 then
			core.set_node(pos, {name = base})
			return
		end
		-- check if there is water nearby
		local wet_lvl = core.get_item_group(node.name, "wet")
		if core.find_node_near(pos, 3, {"group:water"}) then
			-- if it is dry soil and not base node, turn it into wet soil
			if wet_lvl == 0 then
				core.set_node(pos, {name = wet})
			end
		else
			-- only turn back if there are no unloaded blocks (and therefore
			-- possible water sources) nearby
			if not core.find_node_near(pos, 3, {"ignore"}) then
				-- turn it back into base if it is already dry
				if wet_lvl == 0 then
					-- only turn it back if there is no plant/seed on top of it
					if core.get_item_group(nn.name, "plant") == 0 and core.get_item_group(nn.name, "seed") == 0 then
						core.set_node(pos, {name = base})
					end

				-- if its wet turn it back into dry soil
				elseif wet_lvl == 1 then
					core.set_node(pos, {name = dry})
				end
			end
		end
	end,
})