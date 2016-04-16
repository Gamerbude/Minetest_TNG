-- hunger.register_food(name, saturation, replace_with_item, poisen, heal, sound)

hunger.register_food("default:apple", 2)
hunger.register_food("default:pear", 2)

if core.get_modpath("food") then
	hunger.register_food("food:roll", 3)
	hunger.register_food("food:roll_with_fried_egg", 5, nil, nil, 1) -- heals one heart
	hunger.register_food("food:fried_egg")
end

if core.get_modpath("farming") then
	hunger.register_food("farming:potato", 1)
end

if core.get_modpath("flowers") then
	hunger.register_food("flowers:mushroom_brown", 1)
	hunger.register_food("flowers:mushroom_red", 1, "", 3)
end

if core.get_modpath("creatures") then
	hunger.register_food("creatures:meat", 6, "default:bone")
	hunger.register_food("creatures:flesh", 3, "default:bone")
	hunger.register_food("creatures:rotten_flesh", 2, "default:bone", 4)
	
	if core.get_modpath("chicken") then
		hunger.register_food("creatures:chicken_flesh", 1, "default:bone")
		hunger.register_food("creatures:chicken_meat", 3, "default:bone")
	end
end
