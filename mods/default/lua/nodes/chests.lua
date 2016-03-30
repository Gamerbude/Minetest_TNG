-- Formspecs

local chest_formspec =
	"size[8,10.6]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	-- label (Chest)
	"label[1,0.25;Chest]" ..
	-- Chest image
	"image[0,0;1,1;" .. core.inventorycube("default_chest_top.png", "default_chest_front.png", "default_chest_side.png") .. "]" ..
	-- chest inventory
	"list[current_name;main;0,1.2;8,4;]" ..
	-- Inventory icon
	"image[0,5.4;1,1;default_inventory_icon.png]" ..
	-- label (Inventory)
	"label[1,5.65;Inventory]" ..
	-- inventory 
	"list[current_player;main;0,6.5;8,1;]" ..
	"list[current_player;main;0,7.7;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 4.85)

local function get_locked_chest_formspec(pos, player)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,10.6]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		-- label (Chest)
		"label[1,0.25;Locked Chest by " .. player:get_player_name() .. "]" ..
		-- Chest image
		"image[0,0;1,1;" .. core.inventorycube("default_chest_top.png", "default_chest_lock.png", "default_chest_side.png") .. "]" ..
		-- Chest inventory
		"list[nodemeta:" .. spos .. ";main;0,1.2;8,4;]" ..
		-- Inventory icon
		"image[0,5.4;1,1;default_inventory_icon.png]" ..
		-- label (Inventory)
		"label[1,5.65;Inventory]" ..
		-- inventory
		"list[current_player;main;0,6.5;8,1;]" ..
		"list[current_player;main;0,7.7;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,4.85)
	return formspec
end


-- Helper functions

local function drop_chest_stuff()
	return function(pos, oldnode, oldmetadata, digger)
		local meta = core.get_meta(pos)
		meta:from_table(oldmetadata)
		local inv = meta:get_inventory()
		for i = 1, inv:get_size("main") do
			local stack = inv:get_stack("main", i)
			if not stack:is_empty() then
				local p = {
					x = pos.x + math.random(0, 5)/5 - 0.5,
					y = pos.y,
					z = pos.z + math.random(0, 5)/5 - 0.5}
				core.add_item(p, stack)
			end
		end
	end
end

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end


-- Nodes

default.register_node("default:chest", {
	description = "Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fuel = 8},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_dig_node = drop_chest_stuff(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. core.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves stuff to chest at " .. core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes stuff from chest at " .. core.pos_to_string(pos))
	end,
})

default.register_node("default:chest_locked", {
	description = "Locked Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fuel = 8},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_dig_node = drop_chest_stuff(),
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by " ..
				meta:get_string("owner") .. ")")
	end,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", "Locked Chest")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	end,
	can_dig = function(pos, player)
		local meta = core.get_meta(pos);
		return has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = core.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = core.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = core.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves stuff to locked chest at " .. core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes stuff from locked chest at " .. core.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker)
		local meta = core.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			core.show_formspec(
				clicker:get_player_name(),
				"default:chest_locked",
				get_locked_chest_formspec(pos, clicker)
			)
		end
	end,
	on_blast = function() end,
})
