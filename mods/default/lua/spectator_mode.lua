--[[
License of this file:
---------------------
Copyright (C) 2016 kilbith <jeanpatrick.guerrero@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


Note:
-----
This file is originallly from kilbith's mod: Spectator Mode!
See: https://github.com/minetest-mods/spectator_mode/ for details.
--]]

local original_pos = {}

core.register_privilege("watch", "Player can watch other players")

local function unwatching(name)
	local watcher = core.get_player_by_name(name)
	local privs = core.get_player_privs(name)

	if watcher and default.player_attached[name] == true then
		watcher:set_detach()
		default.player_attached[name] = false
		watcher:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
		watcher:set_nametag_attributes({color = {a=255, r=255, g=255, b=255}})

		watcher:hud_set_flags({
			healthbar = true,
			minimap = true,
			breathbar = true,
			hotbar = true,
			wielditem = true,
			crosshair = true
		})

		watcher:set_properties({
			visual_size = {x=1, y=1},
			makes_footstep_sound = true,
			collisionbox = {-0.3, -1, -0.3, 0.3, 1, 0.3}
		})

		if not privs.interact and privs.watch == true then
			privs.interact = true
			core.set_player_privs(name, privs)
		end

		if original_pos[watcher] then
			core.after(0.1, function()
				watcher:setpos(original_pos[watcher])
				original_pos[watcher] = {}
			end)
		end
	end
end

core.register_chatcommand("watch", {
	params = "<to_name>",
	description = "watch a given player",
	privs = {watch=true},
	func = function(name, param)
		local watcher = core.get_player_by_name(name)
		local target = core.get_player_by_name(param)
		local privs = core.get_player_privs(name)

		if target and watcher ~= target then
			if default.player_attached[name] == true then
				unwatching(param)
			else
				original_pos[watcher] = watcher:getpos()
			end
		
			default.player_attached[name] = true
			watcher:set_attach(target, "", {x=0, y=-5, z=-20}, {x=0, y=0, z=0})
			watcher:set_eye_offset({x=0, y=-5, z=-20}, {x=0, y=0, z=0})
			watcher:set_nametag_attributes({color = {a=0}})

			watcher:hud_set_flags({
				healthbar = false,
				minimap = false,
				breathbar = false,
				hotbar = false,
				wielditem = false,
				crosshair = false
			})

			watcher:set_properties({
				visual_size = {x=0, y=0},
				makes_footstep_sound = false,
				collisionbox = {0}
			})

			privs.interact = nil
			core.set_player_privs(name, privs)

			return true, "Watching '"..param.."' at "..core.pos_to_string(vector.round(target:getpos()))
		end

		return false, "Invalid parameter ('"..param.."')."
	end
})

core.register_chatcommand("unwatch", {
	description = "unwatch a player",
	privs = {watch=true},
	func = function(name, param)	
		unwatching(name)
	end
})

core.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	unwatching(name)
end)

