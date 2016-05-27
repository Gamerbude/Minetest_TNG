default.register_node("farming:straw", {
	register = {stair = true, slab = true},
	description = "Straw",
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 4},
	sounds = default.node_sound_leaves_defaults(),
	stair = {legacy_alias = "stairs:stair_straw"},
	slab = {legacy_alias = "stairs:slab_straw"},
})


for i = 1, 5 do		
	core.override_item("default:grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_wheat'}, rarity = 5},
			{items = {'default:grass_1'}},
		}
	}})
end

core.override_item("default:junglegrass", {
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_cotton'}, rarity = 8},
			{items = {'default:junglegrass'}},
		}
	}
})

-- Wool
core.register_craft({
	output = "default:wool_white",
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

-- Straw
core.register_craft({
	output = "farming:straw 3",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
	}
})

core.register_craft({
	output = "farming:wheat 3",
	recipe = {
		{"farming:straw"},
	}
})

-- Garden Soil
core.register_craft({
	type = "shapeless",
	output = "farming:garden_soil",
	recipe = {"group:dirt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	},
})