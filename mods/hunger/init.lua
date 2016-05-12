-- mods/hunger/init.lua
-- ====================
-- See README.txt for licensing and other information.

hunger = {}

local hunger_players = {}

hunger.TICK = 800		-- time in seconds after that 1 hunger point is taken
hunger.HEALTH_TICK = 25		-- time in seconds after player gets healed/damaged
hunger.MOVE_TICK = 0.5		-- time in seconds after the movement is checked

hunger.EXHAUST_DIG = 3		-- exhaustion increased this value after digged node
hunger.EXHAUST_PLACE = 1	-- .. after digging node
hunger.EXHAUST_MOVE = 1.5	-- .. if player movement detected
hunger.EXHAUST_JUMP = 5		-- .. if jumping
hunger.EXHAUST_CRAFT = 20	-- .. if player crafts
hunger.EXHAUST_PUNCH = 40	-- .. if player punches another player
hunger.EXHAUST_LVL = 160	-- at what exhaustion player saturation gets lowered

hunger.HEAL = 1			-- number of HP player gets healed after hunger.HEALTH_TICK
hunger.HEAL_LVL = 5		-- lower level of saturation needed to get healed
hunger.STARVE = 1		-- number of HP player gets damaged by hunger after hunger.HEALTH_TICK
hunger.STARVE_LVL = 3		-- level of staturation that causes starving

hunger.VISUAL_MAX = 20		-- hud bar extends only to 20


local function hunger_read(player)
	local inv = player:get_inventory()
	if not inv then
		return nil
	end

	-- itemstack storage is offest by 1 to make the math work
	local v = inv:get_stack("hunger", 1):get_count()
	if v == 0 then
		v = 21
		inv:set_stack("hunger", 1, ItemStack({name = ":", count = v}))
	end

	return v - 1
end

local function hunger_save(player)
	local inv = player:get_inventory()
	if not inv then
		return nil
	end
	local name = player:get_player_name()
	local level = hunger_players[name].level

	level = math.max(level, 0)

	inv:set_stack("hunger", 1, ItemStack({name = ":", count = level + 1}))
	return true
end

local function hunger_update(player, level)
	local name = player:get_player_name()
	if not name then
		return false
	end
	local old = hunger_players[name].level
	if level == old then
		return
	end
	hunger_players[name].level = level

	player:hud_change(hunger_players[name].hud_id, "number", math.min(hunger.VISUAL_MAX, level))
	hunger_save(player)
end

local function exhaust_player(player, v)
	if not player or not player:is_player() then
		return
	end

	local name = player:get_player_name()
	if not name then
		return
	end

	local s = hunger_players[name]
	if not s then
		return
	end

	local e = s.exhaust
	if not e then
		s.exhaust = 0
	end

	e = e + v

	if e > hunger.EXHAUST_LVL then
		e = 0
		local h = tonumber(hunger_players[name].level)
		if h > 0 then
			hunger_update(player, h - 1)
		end
	end

	s.exhaust = e
end

-- Time based hunger functions
local hunger_timer = 0
local health_timer = 0
local action_timer = 0

local function hunger_globaltimer(dtime)
	hunger_timer = hunger_timer + dtime
	health_timer = health_timer + dtime
	action_timer = action_timer + dtime

	if action_timer > hunger.MOVE_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local controls = player:get_player_control()
			-- Determine if the player is walking
			if controls.jump then
				exhaust_player(player, hunger.EXHAUST_JUMP)
			elseif controls.up or controls.down or controls.left or controls.right then
				exhaust_player(player, hunger.EXHAUST_MOVE)
			end
		end
		action_timer = 0
	end

	-- lower saturation by 1 point after hunger.TICK second(s)
	if hunger_timer > hunger.TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local name = player:get_player_name()
			local tab = hunger_players[name]
			if tab then
				local h = tab.level
				if h > 0 then
					hunger_update(player, h - 1)
				end
			end
		end
		hunger_timer = 0
	end

	-- heal or damage player, depending on saturation
	if health_timer > hunger.HEALTH_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local name = player:get_player_name()
			local tab = hunger_players[name]
			if tab then
				local air = player:get_breath() or 0
				local hp = player:get_hp()

				-- don't heal if drowning or dead
				-- TODO: don't heal if poisoned?
				local h = tonumber(tab.level)
				if h >= hunger.HEAL_LVL and h >= hp and hp > 0 and air > 0 then
					player:set_hp(hp + hunger.HEAL)
					hunger_update(player, h - 1)
				end

				-- or damage player by 1 hp if saturation is < 2 (of 30)
				if tonumber(tab.level) < hunger.STARVE_LVL then
					player:set_hp(hp - hunger.STARVE)
				end
			end
		end

		health_timer = 0
	end
end

local function poison_player(ticks, time, elapsed, user)
	if elapsed <= ticks then
		core.after(time, poison_player, ticks, time, elapsed + 1, user)
	else
		local name = user:get_player_name()
		user:hud_change(hunger_players[name].hud_id, "text", "hunger_hud_fg.png")
	end
	local hp = user:get_hp() -1 or 0
	if hp > 0 then
		user:set_hp(hp)
	end
end

-- override core.do_item_eat() so we can redirect hp_change to hunger
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local old_itemstack = itemstack
	itemstack = hunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
		if result then
			return result
		end
	end
	return itemstack
end

-- not local since it's called from within core context
function hunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	if not itemstack then
		return itemstack
	end

	if not user then
		return itemstack
	end

	local name = user:get_player_name()
	if not hunger_players[name] then
		return itemstack
	end

	local level = tonumber(hunger_players[name].level or 0)
	if level >= hunger.VISUAL_MAX then
		return itemstack
	end

	if hp_change > 0 then
		level = level + hp_change
		hunger_update(user, level)
	else
		-- assume hp_change < 0.
		user:hud_change(hunger_players[name].hud_id, "text", "hunger_hud_poison.png")
		poison_player(2.0, -hp_change, 0, user)
	end

	core.sound_play("hunger_eat", {to_player = name, gain = 0.7})

	if replace_with_item then
		if itemstack:is_empty() then
			itemstack:add_item(replace_with_item)
		else
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=replace_with_item}) then
				inv:add_item("main", replace_with_item)
			else
				local pos = user:getpos()
				pos.y = math.floor(pos.y + 0.5)
				core.add_item(pos, replace_with_item)
			end
		end
	else
		itemstack:take_item()
	end

	return itemstack
end

-- hunger is disabled if damage is disabled
if core.setting_getbool("enable_damage") and core.is_yes(core.setting_get("enable_hunger") or "1") then
	core.register_on_joinplayer(function(player)
		local inv = player:get_inventory()
		inv:set_size("hunger", 1)

		local name = player:get_player_name()
		hunger_players[name] = {}
		hunger_players[name].level = hunger_read(player)
		hunger_players[name].exhaust = 0
		local level = math.min(hunger_players[name].level, hunger.VISUAL_MAX)
		local id = player:hud_add({
			name = "hunger",
			hud_elem_type = "statbar",
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "hunger_hud_fg.png",
			number = level,
			alignment = {x = -1, y = -1},
			offset = {x = -266, y = -110},
			background = "hunger_hud_bg.png",
			max = 0,
		})
		hunger_players[name].hud_id = id
	end)

	core.register_globalstep(hunger_globaltimer)

	core.register_on_placenode(function(pos, oldnode, player, ext)
		exhaust_player(player, hunger.EXHAUST_PLACE)
	end)
	core.register_on_dignode(function(pos, oldnode, player, ext)
		exhaust_player(player, hunger.EXHAUST_DIG)
	end)
	core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		exhaust_player(player, hunger.EXHAUST_CRAFT)
	end)
	core.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
		exhaust_player(hitter, hunger.EXHAUST_PUNCH)
	end)

	core.register_on_respawnplayer(function(player)
		hunger_update(player, hunger.VISUAL_MAX)
	end)
end

