-- mods/default/crafting.lua

core.register_craft({
	output = "default:wood 4",
	recipe = {
		{"default:tree"},
	}
})

core.register_craft({
	output = "default:junglewood 4",
	recipe = {
		{"default:jungletree"},
	}
})

core.register_craft({
	output = "default:pine_wood 4",
	recipe = {
		{"default:pine_tree"},
	}
})

core.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"default:acacia_tree"},
	}
})

core.register_craft({
	output = "default:birch_wood 4",
	recipe = {
		{"default:birch_tree"},
	}
})

core.register_craft({
	output = "default:stick 4",
	recipe = {
		{"group:wood"},
	}
})

core.register_craft({
	output = "default:fence_wood 2",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
	}
})

core.register_craft({
	output = "default:sign_wall",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:torch 4",
	recipe = {
		{"group:coal"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:pick_wood",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:pick_stone",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:pick_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:pick_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:pick_mese",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:pick_diamond",
	recipe = {
		{"default:diamond", "default:diamond", "default:diamond"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:shovel_wood",
	recipe = {
		{"group:wood"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:shovel_stone",
	recipe = {
		{"group:stone"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:shovel_steel",
	recipe = {
		{"default:steel_ingot"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:shovel_bronze",
	recipe = {
		{"default:bronze_ingot"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:shovel_mese",
	recipe = {
		{"default:mese_crystal"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:shovel_diamond",
	recipe = {
		{"default:diamond"},
		{"group:stick"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:axe_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_stone",
	recipe = {
		{"group:stone", "group:stone"},
		{"group:stone", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_mese",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal"},
		{"default:mese_crystal", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_diamond",
	recipe = {
		{"default:diamond", "default:diamond"},
		{"default:diamond", "group:stick"},
		{"", "group:stick"},
	}
})

core.register_craft({
	output = "default:axe_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:stick", "group:wood"},
		{"group:stick",""},
	}
})

core.register_craft({
	output = "default:axe_stone",
	recipe = {
		{"group:stone", "group:stone"},
		{"group:stick", "group:stone"},
		{"group:stick", ""},
	}
})

core.register_craft({
	output = "default:axe_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"group:stick", "default:steel_ingot"},
		{"group:stick", ""},
	}
})

core.register_craft({
	output = "default:axe_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot"},
		{"group:stick", "default:bronze_ingot"},
		{"group:stick", ""},
	}
})

core.register_craft({
	output = "default:axe_mese",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal"},
		{"group:stick", "default:mese_crystal"},
		{"group:stick", ""},
	}
})

core.register_craft({
	output = "default:axe_diamond",
	recipe = {
		{"default:diamond", "default:diamond"},
		{"group:stick", "default:diamond"},
		{"group:stick", ""},
	}
})

core.register_craft({
	output = "default:sword_wood",
	recipe = {
		{"group:wood"},
		{"group:wood"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:sword_stone",
	recipe = {
		{"group:stone"},
		{"group:stone"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:sword_steel",
	recipe = {
		{"default:steel_ingot"},
		{"default:steel_ingot"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:sword_bronze",
	recipe = {
		{"default:bronze_ingot"},
		{"default:bronze_ingot"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:sword_mese",
	recipe = {
		{"default:mese_crystal"},
		{"default:mese_crystal"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:sword_diamond",
	recipe = {
		{"default:diamond"},
		{"default:diamond"},
		{"group:stick"},
	}
})

core.register_craft({
	output = "default:rail 24",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

core.register_craft({
	output = "default:chest",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

core.register_craft({
	output = "default:chest_locked",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "default:steel_ingot", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

core.register_craft({
	output = "default:furnace",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "", "group:stone"},
		{"group:stone", "group:stone", "group:stone"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:bronze_ingot",
	recipe = {"default:steel_ingot", "default:copper_ingot"},
})

core.register_craft({
	output = "default:coalblock",
	recipe = {
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
	}
})

core.register_craft({
	output = "default:coal_lump 9",
	recipe = {
		{"default:coalblock"},
	}
})

core.register_craft({
	output = "default:steelblock",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})

core.register_craft({
	output = "default:steel_ingot 9",
	recipe = {
		{"default:steelblock"},
	}
})

core.register_craft({
	output = "default:copperblock",
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
	}
})

core.register_craft({
	output = "default:copper_ingot 9",
	recipe = {
		{"default:copperblock"},
	}
})

core.register_craft({
	output = "default:bronzeblock",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
	}
})

core.register_craft({
	output = "default:bronze_ingot 9",
	recipe = {
		{"default:bronzeblock"},
	}
})

core.register_craft({
	output = "default:goldblock",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	}
})

core.register_craft({
	output = "default:gold_ingot 9",
	recipe = {
		{"default:goldblock"},
	}
})

core.register_craft({
	output = "default:diamondblock",
	recipe = {
		{"default:diamond", "default:diamond", "default:diamond"},
		{"default:diamond", "default:diamond", "default:diamond"},
		{"default:diamond", "default:diamond", "default:diamond"},
	}
})

core.register_craft({
	output = "default:diamond 9",
	recipe = {
		{"default:diamondblock"},
	}
})

core.register_craft({
	output = "default:sandstone",
	recipe = {
		{"group:sand", "group:sand"},
		{"group:sand", "group:sand"},
	}
})

core.register_craft({
	output = "default:sand 4",
	recipe = {
		{"default:sandstone"},
	}
})

core.register_craft({
	output = "default:sandstonebrick 4",
	recipe = {
		{"default:sandstone", "default:sandstone"},
		{"default:sandstone", "default:sandstone"},
	}
})

core.register_craft({
	output = "default:clay",
	recipe = {
		{"default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump"},
	}
})

core.register_craft({
	output = "default:brick",
	recipe = {
		{"default:clay_brick", "default:clay_brick"},
		{"default:clay_brick", "default:clay_brick"},
	}
})

core.register_craft({
	output = "default:clay_brick 4",
	recipe = {
		{"default:brick"},
	}
})

core.register_craft({
	output = "default:paper",
	recipe = {
		{"default:papyrus", "default:papyrus", "default:papyrus"},
	}
})

core.register_craft({
	output = "default:book",
	recipe = {
		{"default:paper"},
		{"default:paper"},
		{"default:paper"},
	}
})

core.register_craft({
	output = "default:bookshelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"default:book", "default:book", "default:book"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

core.register_craft({
	output = "default:ladder",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

core.register_craft({
	output = "default:mese",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
	}
})

core.register_craft({
	output = "default:mese_crystal 9",
	recipe = {
		{"default:mese"},
	}
})

core.register_craft({
	output = "default:mese_crystal_fragment 9",
	recipe = {
		{"default:mese_crystal"},
	}
})

core.register_craft({
	output = "default:meselamp 1",
	recipe = {
		{"", "default:mese_crystal",""},
		{"default:mese_crystal", "default:glass", "default:mese_crystal"},
	}
})

core.register_craft({
	output = "default:obsidian_shard 9",
	recipe = {
		{"default:obsidian"}
	}
})

core.register_craft({
	output = "default:obsidian",
	recipe = {
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
	}
})

core.register_craft({
	output = "default:obsidianbrick 4",
	recipe = {
		{"default:obsidian", "default:obsidian"},
		{"default:obsidian", "default:obsidian"}
	}
})

core.register_craft({
	output = "default:stonebrick 4",
	recipe = {
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
	}
})

core.register_craft({
	output = "default:desert_stonebrick 4",
	recipe = {
		{"default:desert_stone", "default:desert_stone"},
		{"default:desert_stone", "default:desert_stone"},
	}
})

core.register_craft({
	output = "default:snowblock",
	recipe = {
		{"default:snow", "default:snow", "default:snow"},
		{"default:snow", "default:snow", "default:snow"},
		{"default:snow", "default:snow", "default:snow"}
	}
})

core.register_craft({
	output = "default:snow 9",
	recipe = {
		{"default:snowblock"}
	}
})

core.register_craft({
	output = "default:itemframe",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:paper", "default:stick"},
		{"default:stick", "default:stick", "default:stick"}
	}
})

core.register_craft({
	output = "default:bonemeal 4",
	recipe = {
		{"default:bone"}
	}
})

--
-- Crafting (tool repair)
--
core.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

--
-- Cooking recipes
--

core.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
})

core.register_craft({
	type = "cooking",
	output = "default:obsidian_glass",
	recipe = "default:obsidian_shard",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:mossycobble",
})

core.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "default:iron_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "default:copper_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:clay_brick",
	recipe = "default:clay_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:charcoal",
	recipe = "group:tree",
})
