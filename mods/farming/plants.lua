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
