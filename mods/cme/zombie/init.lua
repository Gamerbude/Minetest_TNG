--= Zombie for Creatures MOB-Engine (cme) =--
-- Copyright (c) 2015-2016 BlockMen <blockmen2015@gmail.com>
-- Copyright (c) 2016 LNJ <lnj.git@gmail.com>
--
-- init.lua
--
-- This software is provided 'as-is', without any express or implied warranty. In no
-- event will the authors be held liable for any damages arising from the use of
-- this software.
--
-- Permission is granted to anyone to use this software for any purpose, including
-- commercial applications, and to alter it and redistribute it freely, subject to the
-- following restrictions:
--
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software in a
-- product, an acknowledgment in the product documentation is required.
-- 2. Altered source versions must be plainly marked as such, and must not
-- be misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
--


default.register_craftitem(":creatures:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "creatures_rotten_flesh.png",
	on_use = core.item_eat(1),
})

local snowSkins = {"jacket", "frozen"}

local function setSkin(self)
  if self.skin ~= "normal" then
    self.object:set_properties({textures = {"creatures_zombie_" .. self.skin .. ".png"}})
  else
    self.object:set_properties({textures = {"creatures_zombie.png"}})
  end
end

local def = {
  -- general
  name = "creatures:zombie",
  stats = {
    hp = default.get_difficult_and_set(16, 22, 30), -- 16 hp (easy), 22 hp (normal), 30 hp (hard)
    lifetime = default.get_difficult_and_set(240, 300, 480), -- 4 min (easy), 5 min (normal), 8 min (hard)
    can_jump = 1,
    can_swim = true,
    can_burn = true,
    has_falldamage = true,
    has_kockback = true,
    light = {min = 0, max = 8},
    hostile = true,
  },

  modes = {
    idle = {chance = 0.7, duration = 3, update_yaw = 6},
    walk = {chance = 0.3, duration = 5.5, moving_speed = 1.5},
    -- special modes
    attack = {chance = 0, moving_speed = default.get_difficult_and_set(2.2, 2.5, 2.9)},
  },

  model = {
    mesh = "creatures_zombie.b3d",
    textures = {"creatures_zombie.png"},
    collisionbox = {-0.25, -0.01, -0.3, 0.25, 1.75, 0.3},
    rotation = -90.0,
    animations = {
      idle = {start = 0, stop = 80, speed = 15},
      walk = {start = 102, stop = 122, speed = 15.5},
      attack = {start = 102, stop = 122, speed = 25},
      death = {start = 81, stop = 101, speed = 28, loop = false, duration = 2.12},
    },
  },

  sounds = {
      on_damage = {name = "creatures_zombie_hit", gain = 0.4, distance = 10},
      on_death = {name = "creatures_zombie_death", gain = 0.7, distance = 10},
      swim = {name = "creatures_splash", gain = 1.0, distance = 10},
      random = {
        idle = {name = "creatures_zombie", gain = 0.7, distance = 12},
      },
  },

  combat = {
    attack_damage = default.get_difficult_and_set(1, 2, 4),
    attack_speed = default.get_difficult_and_set(0.5, 0.6, 0.8),
    attack_radius = 1.1,

    search_enemy = true,
    search_timer = default.get_difficult_and_set(2.5, 2, 1.2),
    search_radius = default.get_difficult_and_set(10, 12, 15),
    search_type = "player",
  },

  spawning = {
    abm_nodes = {
      spawn_on = {"default:stone", "default:dirt_with_grass", "default:dirt",
        "default:cobblestone", "default:mossycobble", "group:sand",
        "default:sandstonebrick", "default:stonebrick", "default:desert_stonebrick",
        "default:desert_stone", "default:ice", "default:snowblock",
        "default:dirt_with_snow", "default:snow"},
    },
    abm_interval = 36,
    abm_chance = 7600,
    max_number = 1,
    number = 2,
    light = {min = 0, max = 8},
    height_limit = {min = default.get_difficult_and_set(-160, -200, -350), max = 150},

    spawn_egg = {
      description = "Zombie Spawn-Egg",
      texture = "creatures_egg_zombie.png",
    },

    spawner = {
      description = "Zombie Spawner",
      range = 8,
      number = 6,
      light = {min = 0, max = 8},
    }
  },
  
  get_staticdata = function(self)
    return {
      skin = self.skin
    }
  end,
  
  on_activate = function(self, staticdata)
    if self.skin == nil then
      local pos = self.object:getpos()
      pos = {x = pos.x, y = pos.y - 2, z = pos.z}
      local nodename = core.get_node(pos).name
      
      -- snowy = 1 are nodes with snow, snowy = 2 is ice
      if core.get_item_group(nodename, "snowy") == 1 or core.get_item_group(nodename, "snowy") == 2 then
        self.skin = snowSkins[math.random(1, #snowSkins)]
      else
        self.skin = "normal"
      end
    end
    
    setSkin(self)
  end,

  drops = {
    {"creatures:rotten_flesh", {min = 1, max = 2}, chance = 0.7},
    {"default:bone", {min = 1, max = 2}, chance = 0.2},
    {"default:coal_lump", {min = 1, max = 3}, chance = 0.017},
    {"farming:potato", {min = 1, max = 2}, chance = 0.01}
  }
}

creatures.register_mob(def)


-- Place spawners in dungeons

local function place_spawner(tab)
	local pos = tab[math.random(1, (#tab or 3))]
	pos.y = pos.y - 1
	local n = core.get_node_or_nil(pos)
	if n and n.name ~= "air" then
		pos.y = pos.y + 1
		core.set_node(pos, {name = "creatures:zombie_spawner"})
	end
end
core.set_gen_notify("dungeon")
core.register_on_generated(function(minp, maxp, blockseed)
	local ntf = core.get_mapgen_object("gennotify")
	if ntf and ntf.dungeon and #ntf.dungeon > 2 then
		core.after(3, place_spawner, table.copy(ntf.dungeon))
	end
end)
