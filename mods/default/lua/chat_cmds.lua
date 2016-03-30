-- mods/default/lua/chat_cmds.lua

core.register_chatcommand("whoami", {
	params = "",
	description = "Check your name",
	privs = {},
	func = function(name)
		core.chat_send_player(name, "Your name is: " .. name)
	end,
})

core.register_chatcommand("ip", {
	params = "",
	description = "Show your IP address",
	privs = {},
	func = function(name)
		core.chat_send_player(name, "Your IP address is: " .. core.get_player_ip(name))
	end
})

core.register_chatcommand("kill", {
	params = "",
	description = "Kill yourself",
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then
      			return
    		end

		if core.setting_getbool("enable_damage") == false then
			core.chat_send_player(name, "Can't kill yourself. Damage is disabled on this server.")
		else
			player:set_hp(0)
			core.chat_send_player(name, "You suicided.")
		end
	end
})
