local function place_grass(pos)
	local grassNum
	-- higher chance that the grass is tall
	if math.random(0, 10) > 4 then
		grassNum = math.random(4, 5)
	else
		grassNum = math.random(1, 3)
	end
	core.set_node(pos, {name = "default:grass_" .. tostring(grassNum)})
end

local function grow_plants(pointed_thing)
	if not core.get_modpath("flowers") then
		return false
	end
	
	local growed = false
	local flowers = {}
	flowers[0] = "flowers:rose"
	flowers[1] = "flowers:tulip"
	flowers[2] = "flowers:dandelion_yellow"
	flowers[3] = "flowers:geranium"
	flowers[4] = "flowers:viola"
	flowers[5] = "flowers:dandelion_white"
	
	for i = -2, 3, 1 do
		for j = -3, 2, 1 do
			local pos = pointed_thing.above
			local pos = {x=pos.x+i, y=pos.y, z=pos.z+j}
			local node = core.get_node(pos)
			local node2 = core.get_node({x=pos.x, y=pos.y-1, z=pos.z})

			if node.name == "air" then
				if node2.name == "default:dirt_with_grass" then
					if math.random(0, 10) > 8 then
						core.set_node(pos, {name = flowers[math.random(0, 5)]})
						growed = true
					elseif math.random(0, 5) > 2 then
						place_grass(pos)
						growed = true
					end
				elseif node2.name == "default:water_source" then
					if math.random(0, 10) == 10 then
						core.set_node(pos, {name = "flowers:waterlily", param2 = math.random(0, 2)})
						growed = true
					end
				end
				
			end
		end
	end
	
	return growed
end

--[[
local function grow_sapling(pointed_thing)
	if math.random(0, 10) < 5 then
		local pos = pointed_thing.pos
		local node = pointed_thing

		if core.registered_nodes[node.name].on_grow(pos, node) then growed = true end

		return true
	else
		return false
	end
end
--]]

local function bonemeal_on_use(itemstack, player, pointed_thing)
	-- dont grow flowers/grasses if its too dark
	if not default.is_day() then
		core.chat_send_player(player:get_player_name(), "Plants don't grow at night!")
		return
	end
	
	if pointed_thing.type == "node" then
		local growed = true
		local take_item = true
		
		--if core.get_node_group(pointed_thing.name, "sapling") then
				-- if its a sapling then grow it
		--	growed = grow_sapling(pointed_thing)
		--else
		
		--end
		
		-- grow some flowers and grasses
		growed = grow_plants(pointed_thing)
		
		-- if nothing growed or in creative_mode dont take the item away
		if core.setting_getbool("creative_mode") then
			take_item = false
		elseif not growed then
			take_item = false
		end
		
		-- if item should be taken then do that
		if take_item then itemstack:take_item() end
		
		-- give minetest the changed itemstack
		return itemstack
	end
end

default.register_craftitem("default:bonemeal", {
	description = "Bone Meal",
	inventory_image = "default_bonemeal.png",
	groups = {dye = 1, basecolor_white = 1, excolor_white = 1, unicolor_white = 1},
	on_place = function(itemstack, placer, pointed_thing)
		bonemeal_on_use(itemstack, placer, pointed_thing)
	end
})
