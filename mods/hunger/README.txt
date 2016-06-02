This mod is part of Minetest TNG
================================
Hunger, Version: 1.1.3 (modified)

License of source code:
-----------------------
Copyright (C) 2015 BlockMen <blockmen2015@gmail.com>
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

BlockMen (CC BY-SA 3.0):
  hunger_statbar_poisen.png
  hunger_eat.ogg


About this mod:
~~~~~~~~~~~~~~~
This mod adds hunger mechanics to Minetest, which are based on player actions and on time.
Also it changes the eating in Minetest, e.g. an Apple does not restore Health, but it rises your saturation.
Example: 1 apple fills up the hunger bar by 1 "bread" (statbar symbol).
Although the statbar show 20 hunger points (10 breads) on the HUD you can fill it up to 30 points.

By default it supports a lot of food already (see full list below) and food that for registered via the API.
For more information how to register more food see API.txt

Information:
This mod depends on the "Better HUD" mod (https://github.com/BlockMen/hud) to provide information about your current saturation.


For Modders:
~~~~~~~~~~~~
This mod alters the behavior of minetest.item_eat().
All callbacks that are registered via minetest.register_on_item_eat() are called AFTER this mod actions, so the itemstack
will have changed already when callbacks are called. You can get the original itemstack as 6th parameter of your function then.
