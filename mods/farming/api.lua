local function throw_error(message)
	core.log("error", "[Game] Farming: " .. message)
end

local function can_grow(pos, cond)
	if not pos or not cond then return false end
	
	-- Soil
	soilnode = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not soilnode then return false end
	
	-- Check soil fertility
	local fert = false
	for _, f in pairs(cond.fertility) do
		if core.get_item_group(soilnode.name, f) ~= 0 then
			fert = true
		end
	end
	if fert == false then return false end
	
	-- Check if soil is wet
	if core.get_item_group(soilnode.name, "soil") < 3 then  -- dont grow if on dry soil
		return false
	end
	
	-- Check light
	local light = core.get_node_light(pos)

	if not light or light < cond.light.min or light > cond.light.max then
		return false
	end
	
	-- Check heat
	local heat = core.get_heat(pos)
	
	if not heat or heat < cond.heat.min or heat > cond.heat.max then
		return false
	end
	
	-- Check humidity
	local humidity = core.get_humidity(pos)
	
	if not humidity or humidity < cond.humidity.min or humidity > cond.humidity.max then
		return false
	end
	
	return true
end

local function start_timer(pos, growtime)
	growtime = growtime * default.GROW_TIME_FACTOR
	
	core.get_node_timer(pos):start(math.random(growtime * 0.6, growtime * 1.8))
end

local function next_step(pos, new_name, growtime, cond)
	if can_grow(pos, cond) == false then
		start_timer(pos, growtime / 3) -- retry; only a third of the normal growing time
		return
	end
	-- update plant
	core.set_node(pos, {name = new_name})
end

function farming.register_crop(name, def)
	if not def.steps or not def.growtime then return false end
	
	def.harvest = def.harvest or {}
	def.seed = def.seed or {}
	def.plant = def.plant or {}
	
	def.cond = def.cond or {}
	def.cond.fertility = def.cond.fertility or {}
	def.cond.light = def.cond.light or {min = 8, max = default.LIGHT_MAX}
	def.cond.heat = def.cond.heat or {min = 30, max = 80}
	def.cond.humidity = def.cond.humidity or {min = 22, max = 100}
	
	-- +-----------------------------------------------------------------------------+
	-- |                                Plant Steps                                  |
	-- +-----------------------------------------------------------------------------+
	
	local plantdef = {}
	plantdef[0] = def.plant
	
	-- properties for all steps
	plantdef[0].drawtype = "plantlike"
	plantdef[0].waving = 1
	plantdef[0].paramtype = "light"
	plantdef[0].walkable = false
	plantdef[0].buildable_to = true
	plantdef[0].selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	}
	plantdef[0].sounds = plantdef[0].sounds or default.node_sound_leaves_defaults()
	plantdef[0].groups = plantdef[0].groups or {snappy = 3, flammable = 2, attached_node = 1}
	plantdef[0].groups.plant = 1
	plantdef[0].groups.not_in_creative_inventory = 1
	for k, v in pairs(def.cond.fertility) do
		plantdef[0].groups[v] = 1
	end
	
	
	for i = 1, def.steps do
		local percent = 100 / def.steps * i
		
		-- properties (different from step to step)
		plantdef[i] = table.copy(plantdef[0])
		
		plantdef[i].description = (def.description or "Plant") .. " (" .. percent .. "% Grown)"
		plantdef[i].tiles = {def.texture_prefix .. "_" .. i .. ".png"}
		plantdef[i].groups[name] = i
		
		
		-- growing
		if def.steps == i then -- if already fully grown, do not grow
			plantdef[i].on_timer = nil
			plantdef[i].on_construct = nil
		else
			plantdef[i].on_construct = function(pos)
				start_timer(pos, def.growtime / def.steps)
			end
	
			plantdef[i].on_timer = function(pos, elapsed)
				next_step(pos, "farming:" .. name .. "_" .. i + 1, def.growtime / def.steps, def.cond) -- see above
			end
		end
		
		core.register_node(":farming:" .. name .. "_" .. i, plantdef[i])
	end
	
	
	-- +-----------------------------------------------------------------------------+
	-- |                                 Items                                       |
	-- +-----------------------------------------------------------------------------+
	
	--
	-- Seed
	--
	
	if def.has_seed ~= false then def.has_seed = true end
	
	if def.has_seed then
		local seeddef = def.seed
		local seedname = def.seed.name or ":farming:" .. name .. "_seed"
		seeddef.name = nil
		
		-- properties
		seeddef.description = seeddef.description or def.description .. " Seed"
		seeddef.inventory_image = seeddef.inventory_image or def.texture_prefix .. "_seed.png"
		
		core.register_craftitem(seedname, seeddef)
	end
	
	--
	-- Harvest
	--
	
	local harvestdef = def.harvest
	local harvestname = def.harvest.name or ":farming:" .. name
	
	harvestdef.name = nil
	
	harvestdef.inventory_image = harvestdef.inventory_image or def.texture_prefix .. ".png"
	harvestdef.description = harvestdef.description or def.description
	
	core.register_craftitem(harvestname, harvestdef)
end

farming.register_crop("wheat", {
	description = "Wheat",
	steps = 8,
	texture_prefix = "farming_wheat",
	growtime = 50,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
		heat = {min = 40, max = 90},
		humidity = {min = 25, max = 90},
	},
})