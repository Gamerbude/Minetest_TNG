default.workbench_formspec = 
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	-- main inventory
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	-- crafting field
	"list[current_player;craft;1.75,0.5;3,3;]" ..
	-- crafting preview / output
	"list[current_player;craftpreview;5.75,1.5;1,1;]" ..
	-- label (Workbench)
	"label[0,0;Workbench]"


function default.open_workbench(player)
	player:get_inventory():set_size("craft", 3*3)
	player:get_inventory():set_size("main", 8*4)
	
	minetest.show_formspec(player:get_player_name(), "main", default.workbench_formspec)
end

core.register_node("default:workbench", {
	description = "Workbench",
	tiles = {"default_workbench_top.png", "default_wood.png", "default_workbench_side.png",
		"default_workbench_side.png", "default_workbench_front.png", "default_workbench_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand, flammable = 2},
	on_rightclick = function(pos, node, clicker)
		default.open_workbench(clicker)
	end
})
