This mod is part of Minetest TNG
================================

License of source code:
-----------------------
Copyright (C) 2015 BlockMen <blockmen2015@gmail.com>
Copyright (C) 2016 Auke Kok <sofar@foo-projects.org>
Copyright (C) 2016 LNJ <lnj.git@gmail.com>

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


License of media (textures, sounds, meshes):
--------------------------------------------
(by Authors)

BlockMen <blockmen2015@gmail.com> (CC BY-SA 3.0):
  hunger_hud_poison.png

PilzAdam (WTFPL):
  hunger_hud_fg.png, modified by BlockMen
  hunger_hud_bg.png, modified by BlockMen

sonictechtonic (CC BY 3.0):
  hunger_eat.*.ogg, See: http://www.freesound.org/people/sonictechtonic/sounds/242215/


About this mod:
---------------
This mod adds a hunger mechanic to Minetest. Actions like
crafting, walking, digging or fighting make the player exhausted. When
enough exhaustion has been accumulated, the player gets more hungry.

If a player is low on hunger, they start taking periodical damage,
and ultimately will die if they do not eat food.

Eating food no longer heals the player. Instead, it increases the
saturation of the player. The hunger bar shows how well fed the player
is. More bread pieces means more saturation.


For Modders:
------------
This mod intercepts minetest.item_eat(), and applies the hp_change
as hunger change. The value can be positive (increase saturation) or
negative (periodically damage the player by 1 hp).

Callbacks that are registered via minetest.register_on_item_eat()
are called after this mod, so the itemstack will have changed already
when callbacks are called. You can get the original itemstack as 6th
parameter of your function then.
