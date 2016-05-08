--[[
License of this file:
---------------------
Copyright (C) 2016 EvergreenTree
Copyright (C) 2016 LNJ <lnj.git@gmail.com>
   
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- A table of quips for death messages.
default.death_messages = {}

-- Lava death messages
default.death_messages.lava = {
	" melted into a ball of fire.",
	" thought lava was cool.",
	" melted into a ball of fire.",
	" couldn't resist that warm glow of lava.",
	" dug straight down.",
	" didn't know lava was hot."
}

-- Drowning death messages
default.death_messages.water = {
	" drowned.",
	" ran out of air.",
	" failed at swimming lessons.",
	" tried to impersonate an anchor.",
	" forgot he wasn't a fish.",
	" blew one too many bubbles."
}

-- Burning death messages
default.death_messages.fire = {
	" burned to a crisp.",
	" got a little too warm.",
	" got too close to the camp fire.",
	" just got roasted, hotdog style.",
	" gout burned up. More light that way."
}

-- Other death messages
default.death_messages.other = {
	" died.",
	" did something fatal.",
	" gave up on life.",
	" is somewhat dead now.",
	" passed out -permanently."
}

local function get_message(mtype)
	return default.death_messages[mtype][math.random(1, #default.death_messages[mtype])]
end

core.register_on_dieplayer(function(player)
	local player_name = player:get_player_name()
	local node = core.registered_nodes[core.get_node(player:getpos()).name]
	if core.is_singleplayer() then
		player_name = "You"
	end
	-- Death by lava
	if node.groups.lava ~= nil then
		core.chat_send_all(player_name .. get_message("lava"))
	-- Death by drowning
	elseif player:get_breath() == 0 then
		core.chat_send_all(player_name .. get_message("water"))
	-- Death by fire
	elseif node.name == "fire:basic_flame" then
		core.chat_send_all(player_name .. get_message("fire"))
	-- Death by something else
	else
		core.chat_send_all(player_name .. get_message("other"))
	end

end)
