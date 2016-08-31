local ruin_probability = core.setting_get("ruin_probability") or 25

local perl = {SEED = 9130, OCTA = 3, PERS = 0.5, SCAL = 250}
local perlin = PerlinNoise(perl.SEED, perl.OCTA, perl.PERS, perl.SCAL)

local is_seed_set = false
local function set_seed(seed)
	if not is_seed_set then
		math.randomseed(seed)
		is_seed_set = true
	end
end

local material = {}
material[1] = "cobble"
material[2] = "mossycobble"
material[3] = "glass"

local chest_stuff = {
	{name="default:pear", max = 1, rarity=2},
	{name="default:bread", max = 1, rarity=3},
	{name="farming:seed_wheat", max = 3, rarity=2},
	{name="bucket:bucket_empty", max = 1, rarity=7},
	{name="bucket:bucket_water", max = 1, rarity=9},
	{name="default:sword_wood", max = 1, rarity=3},
	{name="default:sword_stone", max = 1, rarity=4},
	{name="default:sapling", max = 2, rarity=3},
	{name="default:birch_sapling", max = 2, rarity=3},
	{name="default:acacia_sapling", max = 2, rarity=3},
	{name="farming:potato", max = 1, rarity=8},

}

local function can_replace(pos)
	local n = core.get_node_or_nil(pos)
	if not n then
		return true
	end
	local ndef = core.registered_nodes[n.name] or nil
	if ndef and not ndef.walkable then
		return true
	else
		return false
	end
end

local function ground(pos)
	local p = table.copy(pos)
	local cnt = 0
	local mat = "dirt"
	p.y = p.y - 1
	while can_replace(p) == true do
		cnt = cnt + 1
		if cnt > 25 then
			break
		end
		if cnt>math.random(2, 4) then
			mat = "stone"
		end
		core.swap_node(p, {name = "default:" .. mat})
		p.y = p.y - 1
	end
end

local function fill_chest(pos)
	core.set_node(pos, {name="default:chest_old", metadata=""})
	core.after(2, function()
		local n = core.get_node(pos)
		local cnt = 0
		if n ~= nil then
			if n.name == "default:chest_old" then
				local meta = core.get_meta(pos)
				local inv = meta:get_inventory()
				inv:set_size("main", 8*4)
				while cnt < 2 do
					local stuff = chest_stuff[math.random(1, #chest_stuff)]
					local stack = {name=stuff.name, count = 1}
					if math.random(1, stuff.rarity) == stuff.rarity then
						if not inv:contains_item("main", stack) then
							inv:set_stack("main", math.random(1, 32), stack)
							cnt = cnt + 1
						end
					end
				end
			end
		end
	end)
end

local function door(pos, size)
	local p = table.copy(pos)
	p.y = p.y + 1
	if math.random() > 0 then
		if math.random() > 0 then
			p.x = p.x + size.x
		end
			p.z = p.z + math.random(1, size.z - 1)
	else
		if math.random() > 0 then
			p.z = p.z + size.z
		end
		p.x = p.x + math.random(1, size.x - 1)
	end
	core.remove_node(p)
	p.y = p.y + 1
	core.remove_node(p)
end

local function keller(pos, size)
	for yi = 1, 4 do
		local w_h = math.random(3, 4)
		for xi = 1, size.x - 1 do
		for zi = 1, size.z - 1 do
			local p = {x = pos.x + xi, y = pos.y - yi, z = pos.z + zi}
			if yi < w_h then
				core.remove_node(p)
			else
				core.swap_node(p, {name = "default:water_source"})
			end
		end
		end
	end
end

local function generate_sized(pos, size)
	local wood = false
	if math.random(1, 10) > 8 then
		wood = true
	end
 	for yi = 0, 4 do
	for xi = 0, size.x do
	for zi = 0, size.z do
		local p = {x = pos.x + xi, y = pos.y + yi, z = pos.z + zi}
		if yi == 0 then
			core.swap_node(p, {name = "default:" .. material[math.random(1, 2)]})
			core.after(3, ground, p)
		else
			if xi < 1 or xi > size.x - 1 or zi < 1 or zi > size.z - 1 then
				if math.random(1, yi) == 1 then
					local mat = "wood"
					local new
					if not wood then
						new = material[math.random(1, 2)]
					end
					if yi == 2 and math.random(1, 10) == 3 then
						mat = "glass"
					end
					p.y = p.y - 1
					local n = core.get_node_or_nil(p)
					p.y = p.y + 1
					if n and n.name ~= "air" then
						core.swap_node(p, {name = "default:" .. mat})
					end
				end
			else
				core.remove_node(p)
			end
		end
	end
	end
	end

	if math.random(0, 10) > 7 then
		core.after(2, keller, pos, size)
	end

	fill_chest({
		x = pos.x + math.random(1, size.x - 1),
		y = pos.y + 1,
		z = pos.z + math.random(1, size.z - 1)
	})
	door(pos, size)
end

function default.generate_ruins(minp, maxp, seed)
	if not (math.random(1, ruin_probability) == 1) then
		return
	end
	if maxp.y < 0 then
		return
	end

	set_seed(seed)

	local noise = perlin:get2d({x = minp.x, y = minp.y})

	if noise < 0.36 or noise > -0.36 then
		local mpos = {
			x = math.random(minp.x, maxp.x),
			y = math.random(minp.y, maxp.y),
			z = math.random(minp.z, maxp.z)
		}
		core.after(0.1, function()
			local point = core.find_node_near(mpos, 25, {"default:dirt_with_grass"})
			if not point or point == nil or point.y < 0 then
				return
			end

			generate_sized(point, {x = math.random(6, 9), z = math.random(6, 9)})
		end)
	end
end
