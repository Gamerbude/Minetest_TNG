default.register_craftitem("default:pear", {
	description = "Pear",
	inventory_image = "default_pear.png",
	groups = {fruit = 1, food = 1},
	on_use = core.item_eat(1),
})
