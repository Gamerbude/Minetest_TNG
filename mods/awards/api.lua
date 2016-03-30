-- The global award namespace
awards = {
	show_mode = core.setting_get("awards_show_mode") or "hud"
}

-- Table Save Load Functions
function awards.save()
	local file = io.open(core.get_worldpath().."/awards.txt", "w")
	if file then
		file:write(core.serialize(awards.players))
		file:close()
	end
end

function awards.load()
	local file = io.open(core.get_worldpath().."/awards.txt", "r")
	if file then
		local table = core.deserialize(file:read("*all"))
		if type(table) == "table" then
			return table
		end
	end
	return {}
end

awards.players = awards.load()
function awards.player(name)
	return awards.players[name]
end

-- A table of award definitions
awards.def = {}

function awards.tbv(tb, value, default)
	if not default then
		default = {}
	end
	if not tb or type(tb) ~= "table" then
		if not value then
			value = "[NULL]"
		end
		
		core.log("error", "awards.tbv - table " .. dump(value) .. " is null, or not a table! Dump: " .. dump(tb))
		return
	end
	if not value then
		error("[ERROR] awards.tbv was not used correctly!\n"..
			"Value: '"..dump(value).."'\n"..
			"Dump:"..dump(tb))
		return
	end
	if not tb[value] then
		tb[value] = default
	end
end

function awards.assertPlayer(playern)
	awards.tbv(awards.players, playern)
	awards.tbv(awards.players[playern], "name", playern)
	awards.tbv(awards.players[playern], "unlocked")
	awards.tbv(awards.players[playern], "place")
	awards.tbv(awards.players[playern], "count")
	awards.tbv(awards.players[playern], "deaths", 0)
	awards.tbv(awards.players[playern], "joins", 0)
	awards.tbv(awards.players[playern], "chats", 0)
end

-- Load files
dofile(core.get_modpath("awards").."/triggers.lua")

-- API Functions
function awards.register_achievement(name, data_table)
	-- see if a trigger is defined in the achievement definition
	if data_table.trigger and data_table.trigger.type then
		if data_table.trigger.type == "dig" then
			local tmp = {
				award = name,
			 	node = data_table.trigger.node,
			 	target = data_table.trigger.target,
			}
			table.insert(awards.onDig, tmp)
		elseif data_table.trigger.type == "place" then
			local tmp = {
				award = name,
			 	node = data_table.trigger.node,
			 	target = data_table.trigger.target,
			}
			table.insert(awards.onPlace, tmp)
		elseif data_table.trigger.type == "death" then
			local tmp = {
				award = name,
			 	target = data_table.trigger.target,
			}
			table.insert(awards.onDeath, tmp)
		elseif data_table.trigger.type == "chat" then
			local tmp = {
				award = name,
			 	target = data_table.trigger.target,
			}
			table.insert(awards.onChat, tmp)
		elseif data_table.trigger.type == "join" then
			local tmp = {
				award = name,
			 	target = data_table.trigger.target,
			}
			table.insert(awards.onJoin, tmp)
		end
	end

	-- check icon, background and custom_announce data
	if data_table.icon == nil or data_table.icon == "" then
		data_table.icon = "awards_unknown.png"
	end
	if data_table.background == nil or data_table.background == "" then
		data_table.background = "awards_bg_default.png"
	end
	if data_table.custom_announce == nil or data_table.custom_announce == "" then
		data_table.custom_announce = "Achievement Unlocked:"
	end
	
	-- add the achievement to the definition table
	data_table.name = name
	awards.def[name] = data_table
end

-- run a function when a node is dug
function awards.register_onDig(func)
	table.insert(awards.onDig,func)
end

-- run a function when a node is placed
function awards.register_onPlace(func)
	table.insert(awards.onPlace,func)
end

-- run a function when a player dies
function awards.register_onDeath(func)
	table.insert(awards.onDeath,func)
end

-- run a function when a player chats
function awards.register_onChat(func)
	table.insert(awards.onChat,func)
end

-- run a function when a player joins
function awards.register_onJoin(func)
	table.insert(awards.onJoin,func)
end

-- This function is called whenever a target condition is met.
-- It checks if a player already has that achievement, and if they do not,
-- it gives it to them
----------------------------------------------
--awards.give_achievement(name,award)
-- name - the name of the player
-- award - the name of the award to give
function awards.give_achievement(name, award)
	-- Access Player Data
	local data = awards.players[name]
	
	-- Perform checks
	if not data then
		return
	end
	if not awards.def[award] then
		return
	end
	awards.tbv(data, "unlocked")

	-- check to see if the player does not already have that achievement
	if not data.unlocked[award] or data.unlocked[award] ~= award then
		-- Set award flag
		data.unlocked[award] = award

		-- Give Prizes
		if awards.def[award] and awards.def[award].prizes then
			for i = 1, #awards.def[award].prizes do
				local itemstack = ItemStack(awards.def[award].prizes[i])
				if itemstack:is_empty() or not itemstack:is_known() then
					return
				end
				local receiverref = core.get_player_by_name(name)
				if receiverref == nil then
					return
				end
				receiverref:get_inventory():add_item("main", itemstack)
			end
		end

		-- Get data from definition tables
		local title = award
		local desc = ""
		local background = ""
		local icon = ""
		local custom_announce = ""
		if awards.def[award].title then
			title = awards.def[award].title
		end
		if awards.def[award].custom_announce then
			custom_announce = awards.def[award].custom_announce
		end
		if awards.def[award].background then
			background = awards.def[award].background
		end
		if awards.def[award].icon then
			icon = awards.def[award].icon
		end
		if awards.def[award] and awards.def[award].description then
			desc = awards.def[award].description
		end

		-- send the won award message to the player
		if awards.show_mode == "formspec" then
			-- use a formspec to send it
			core.show_formspec(name, "achievements:unlocked", "size[4,2]"..
					"image_button_exit[0,0;4,2;"..background..";close1; ]"..
					"image_button_exit[0.2,0.8;1,1;"..icon..";close2; ]"..
					"label[1.1,1;"..title.."]"..
					"label[0.3,0.1;"..custom_announce.."]")
		elseif awards.show_mode == "chat" then
			-- use the chat console to send it
			core.chat_send_player(name, "Achievement Unlocked: "..title)
			if desc~="" then
				core.chat_send_player(name, desc)
			end
		else
			local player = core.get_player_by_name(name)
			local one = player:hud_add({
				hud_elem_type = "image",
				name = "award_bg",
				scale = {x = 1, y = 1},
				text = background,
				position = {x = 0.5, y = 0},
				offset = {x = 0, y = 138},
				alignment = {x = 0, y = -1}
			})
			local two = player:hud_add({
				hud_elem_type = "text",
				name = "award_au",
				number = 0xFFFFFF,
				scale = {x = 100, y = 20},
				text = "Achievement Unlocked!",
				position = {x = 0.5, y = 0},
				offset = {x = 0, y = 40},
				alignment = {x = 0, y = -1}
			})			
			local three = player:hud_add({
				hud_elem_type = "text",
				name = "award_title",
				number = 0xFFFFFF,
				scale = {x = 100, y = 20},
				text = title,
				position = {x = 0.5, y = 0},
				offset = {x = 30, y = 100},
				alignment = {x = 0, y = -1}
			})			
			local four = player:hud_add({
				hud_elem_type = "image",
				name = "award_icon",
				scale = {x = 4, y = 4},
				text = icon,
				position = {x = 0.5, y = 0},
				offset = {x = -81.5, y = 126},
				alignment = {x = 0, y = -1}
			})
			core.after(core.setting_get("awards_display_time") or 10, function()
				player:hud_remove(one)
				player:hud_remove(two)
				player:hud_remove(three)
				player:hud_remove(four)
			end)
		end
	
		-- record this in the log	
		core.log("action", name.." has unlocked award "..title)
		
		-- save playertable
		awards.save()
	end
end

-- List a player's achievements
core.register_chatcommand("awards", {
	params = "",
	description = "Awards: list awards",
	func = function(name, param)
		awards.showto(name, name, nil, false)
	end
})

core.register_chatcommand("cawards", {
	params = "",
	description = "Awards: list awards in chat",
	func = function(name, param)
		awards.showto(name, name, nil, true)
	end
})

core.register_chatcommand("award", {
	params = "Award name",
	description = "Award: Details of award gotten",
	func = function(name, param)
		local def = awards.def[param]
		if def then
			core.chat_send_player(name, def.title .. ": " .. def.description)
		else
			core.chat_send_player(name, "Award not found.")
		end
	end
})

function awards._order_awards(name)
	local done = {}
	local retval = {}
	local player = awards.player(name)
	if player and player.unlocked then
		for _,got in pairs(player.unlocked) do
			if awards.def[got] then
				done[got] = true
				table.insert(retval,{name=got,got=true})
			end
		end
	end
	for _,def in pairs(awards.def) do
		if not done[def.name] then
			table.insert(retval,{name=def.name,got=false})
		end
	end
	return retval
end

function awards.showto(name, to, sid, text)
	if name == "" or name == nil then
		name = to
	end
	if text then
		if not awards.players[name] or not awards.players[name].unlocked  then
			core.chat_send_player(to, "You have not unlocked any awards")
			return
		end
		core.chat_send_player(to, name.."'s awards:")

		for _, str in pairs(awards.players[name].unlocked) do
			local def = awards.def[str]
			if def then
				if def.title then
					if def.description then				
						core.chat_send_player(to, def.title..": "..def.description)
					else
						core.chat_send_player(to, def.title)
					end
				else
					core.chat_send_player(to, str)
				end
			end
		end
	else
		if sid == nil or sid < 1 then
			sid = 1
		end
		
		local formspec = "size[11,5]" .. default.gui_bg .. default.gui_bg_img
		local listofawards = awards._order_awards(name)
		
		-- Sidebar
		if sid then
			local item = listofawards[sid+0]
			local def = awards.def[item.name]
			if def and def.secret and not item.got then
				formspec = formspec .. "label[1,2.75;Secret Award]"..
									"image[1,0;3,3;awards_unknown.png]"
				if def and def.description then
					formspec = formspec	.. "label[0,3.25;Unlock this award to find out what it is]"				
				end
			else
				local title = item.name
				if def and def.title then
					title = def.title
				end
				local status = ""
				if item.got then
					status = " (got)"
				end
				local icon = ""
				if def and def.icon then
					icon = def.icon
				end
				formspec = formspec .. "label[1,2.75;"..title..status.."]"..
									"image[1,0;3,3;"..icon.."]"
				if def and def.description then
					formspec = formspec	.. "label[0,3.25;"..def.description.."]"				
				end
			end
		end
		
		-- Create list box
		formspec = formspec .. "textlist[4.75,0;6,5;awards;"		
		local first = true
		for _,award in pairs(listofawards) do
			local def = awards.def[award.name]
			if def then
				if not first then
					formspec = formspec .. ","
				end
				first = false
				
				if def.secret and not award.got then
					formspec = formspec .. "#ACACACSecret Award"
				else
					local title = award.name			
					if def and def.title then
						title = def.title
					end			
					if award.got then
						formspec = formspec .. core.formspec_escape(title)
					else
						formspec = formspec .. "#ACACAC".. core.formspec_escape(title)
					end
				end
			end
		end		
		formspec = formspec .. ";"..sid.."]"

		-- Show formspec to user
		core.show_formspec(to,"awards:awards",formspec)
	end
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "awards:awards" then
		return false
	end
	if fields.quit then
		return true
	end
	
	local name = player:get_player_name()
	if fields.awards then
		local event = core.explode_textlist_event(fields.awards)
		if event.type == "CHG" then			
			awards.showto(name,name,event.index,false)	
		end		
	end
	
	return true
end)

