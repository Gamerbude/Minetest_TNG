game = {}
game.name = "next"
game.aliases = {
	-- armor
	{"wooden_helmet",		"armor:wood_head"},
	{"wooden_chestplate",		"armor:wood_chest"},
	{"wooden_leggins",		"armor:wood_legs"},
	{"wooden_shoes",		"armor:wood_feet"},
	{"steel_helmet",		"armor:steel_head"},
	{"steel_chestplate",		"armor:steel_chest"},
	{"steel_leggins",		"armor:steel_legs"},
	{"steel_shoes",			"armor:steel_feet"},
	{"diamond_helmet",		"armor:diamond_head"},
	{"diamond_chestplate",		"armor:diamond_chest"},
	{"diamond_leggins",		"armor:diamond_legs"},
	{"diamond_shoes",		"armor:diamond_feet"},
	-- beds
	{"fancy_bed",			"beds:fancy_bed"},
	{"bed",				"beds:bed"},
	-- boats
	{"boat",			"boats:boat"},
	-- bucket
	{"bucket",			"bucket:bucket_empty"},
	{"water_bucket",		"bucket:bucket_water"},
	{"lava_bucket",			"bucket:bucket_lava"},
	-- creatures (cme)
	{"flesh",			"creatures:flesh"},
	{"meat",			"creatures:meat"},
	{"chicken_flesh",		"creatures:chicken_flesh"},
	{"chicken_meat",		"creatures:chicken_meat"},
	{"rotten_flesh",		"creatures:rotten_flesh"},
	{"feather",			"creatures:feather"},
	{"egg",				"creatures:egg"},
	{"fried_egg",			"creatures:fried_egg"},
	{"shears",			"creatures:shears"},
	{"zombie_spawner",		"creatures:zombie_spawner"},
	{"zombie_spawnegg",		"creatures:zombie_spawnegg"},
	{"ghost_spawner",		"creatures:ghost_spawner"},
	{"ghost_spawnegg",		"creatures:ghost_spawnegg"},
	{"oerrki_spawner",		"creatures:oerrki_spawner"},
	{"oerrki_spawnegg",		"creatures:oerrki_spawnegg"},
	{"sheep_spawner",		"creatures:sheep_spawner"},
	{"sheep_spawnegg",		"creatures:sheep_spawnegg"},
	{"chicken_spawnegg",		"creatures:chicken_spawnegg"},
}

for _, row in ipairs(game.aliases) do
	local alias = row[1]
	local itemstring = row[2]
	
	if core.setting_getbool("no_short_aliases") == true then
		alias = gamename .. ":" .. alias
	end
	
	-- register alias
	minetest.register_alias(alias, itemstring)
end
