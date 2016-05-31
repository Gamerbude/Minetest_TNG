farming.register_crop("wheat", {
	description = "Wheat",
	steps = 8,
	texture_prefix = "farming_wheat",
	growtime = 50,
	has_seed = true,
	craft_seed_by_harvest = true,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
})

farming.register_crop("cotton", {
	description = "Cotton",
	steps = 8,
	texture_prefix = "farming_cotton",
	growtime = 50,
	has_seed = true,
	cond = {
		fertility = {"grassland", "desert"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
})

farming.register_crop("potato", {
	description = "Potato",
	steps = 3,
	texture_prefix = "farming_potato",
	growtime = 50,
	has_seed = false,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
	harvest = {
		on_use = core.item_eat(1),
	},
})
