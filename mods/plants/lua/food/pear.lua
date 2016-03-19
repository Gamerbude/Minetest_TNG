core.register_craftitem("plants:pear", {
	description = "Pear",
	inventory_image = "plants_pear.png",
	groups = {fruit = 1},
	on_use = core.item_eat(1),
})
