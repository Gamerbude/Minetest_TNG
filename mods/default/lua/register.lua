local function register_node_stair(name, def)
	local stair_def
	if not def.stair then
		stair_def = {}
	else
		stair_def = table.copy(def.stair)
	end
	
	local stair_name = stair_def.name or name:split(":")[1] .. ":stair_" .. name:split(":")[2]
	
	stair_def.stack_max = default.STACK_MAX
	stair_def.description = stair_def.description	or def.description .. " Stair"
	stair_def.groups = 	stair_def.groups	or def.groups
	stair_def.sounds = 	stair_def.sounds	or def.sounds
	stair_def.material = 	stair_def.material	or name
	stair_def.tiles = 	stair_def.tiles		or def.tiles
	
	-- clean up
	stair_def.name = nil
	
	default.register_stair(stair_name, stair_def)
end

local function register_node_slab(name, def)
	local slab_def
	if not def.slab then
		slab_def = {}
	else
		slab_def = table.copy(def.slab)
	end
	
	local slab_name = slab_def.name or name:split(":")[1] .. ":slab_" .. name:split(":")[2]
	
	slab_def.stack_max = default.STACK_MAX
	slab_def.description = 	slab_def.description	or def.description .. " Slab"
	slab_def.groups = 	slab_def.groups		or def.groups
	slab_def.sounds = 	slab_def.sounds		or def.sounds
	slab_def.material = 	slab_def.material	or name
	slab_def.tiles = 	slab_def.tiles		or def.tiles
	
	-- clean up
	slab_def.name = nil
	
	default.register_slab(slab_name, slab_def)
end

local function register_node_fence(name, def)
	local fence_def
	if not def.fence then
		fence_def = {}
	else
		fence_def = table.copy(def.fence)
	end
	
	local fence_name = fence_def.name or name:split(":")[1] .. ":fence_" .. name:split(":")[2]
	
	fence_def.stack_max = default.STACK_MAX
	fence_def.description = fence_def.description	or def.description .. " Fence"
	fence_def.sounds = 	fence_def.sounds	or def.sounds
	fence_def.material = 	fence_def.material	or name
	fence_def.texture = 	fence_def.texture	or def.tiles[1]
	
	-- clean up
	fence_def.name = nil
	
	default.register_fence(fence_name, fence_def)
end

local function register_node_fencegate(name, def)
	local fencegate_def
	if not def.fencegate then
		fencegate_def = {}
	else
		fencegate_def = table.copy(def.fencegate)
	end
	
	local fencegate_name = fencegate_def.name or name:split(":")[1] .. ":fencegate_" .. name:split(":")[2]
	
	fencegate_def.stack_max = default.STACK_MAX
	fencegate_def.description =	fencegate_def.description	or def.description .. " Fence Gate"
	fencegate_def.sounds = 		fencegate_def.sounds		or def.sounds
	fencegate_def.material = 	fencegate_def.material		or name
	fencegate_def.tiles =		fencegate_def.tiles		or def.tiles
	
	-- clean up
	fencegate_def.name = nil
	
	default.register_fencegate(fencegate_name, fencegate_def)
end

local function register_node_table(name, def)
	local table_def
	if not def.table then
		table_def = {}
	else
		table_def = table.copy(def.table)
	end
	
	local table_name = table_def.name or name:split(":")[1] .. ":table_" .. name:split(":")[2]
	
	table_def.stack_max = default.STACK_MAX
	table_def.description =	table_def.description	or def.description .. " Table"
	table_def.sounds =	table_def.sounds	or def.sounds
	table_def.material =	table_def.material	or name
	table_def.tiles =	table_def.tiles		or def.tiles
	
	-- clean up
	table_def.name = nil
	
	default.register_table(table_name, table_def)
end

local function register_node_wall(name, def)
	local wall_def
	if not def.wall then
		wall_def = {}
	else
		wall_def = table.copy(def.wall)
	end
	
	local wall_name = wall_def.name or name:split(":")[1] .. ":wall_" .. name:split(":")[2]
	
	wall_def.stack_max = default.STACK_MAX
	wall_def.description =	wall_def.description	or def.description .. " Wall"
	wall_def.sounds =	wall_def.sounds		or def.sounds
	wall_def.material =	wall_def.material	or name
	wall_def.tiles =	wall_def.tiles		or def.tiles
	
	-- clean up
	wall_def.name = nil
	
	default.register_wall(wall_name, wall_def)
end


function default.register_node(name, def)
	--
	-- Register other types of the node (stair, slab, fence, ...)
	--
	if def.register then
		if def.register.stair then
			register_node_stair(name, def)
		end
		if def.register.slab then
			register_node_slab(name, def)
		end
		if def.register.fence then
			register_node_fence(name, def)
		end
		if def.register.fencegate then
			register_node_fencegate(name, def)
		end
		if def.register.table then
			register_node_table(name, def)
		end
		
		-- this is dev only content
		if core.setting_getbool("enable_dev_content") then
			if def.register.wall then
				register_node_wall(name, def)
			end
		end
	end

	def.register = nil
	def.stair = nil
	def.slab = nil
	def.fence = nil
	def.fencegate = nil
	def.table = nil
        def.wall = nil
	
	core.register_node(name, def)
end

function default.register_craftitem(name, def)
	core.register_craftitem(name, def)
end
