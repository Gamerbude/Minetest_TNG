-- mods/default/lua/nodeboxes.lua
-- ==============================
-- See README.txt (in this mod) for licensing and other information.

local function nodebox(box)
	return {type = "fixed", fixed = box}
end


default.node_box = {}

-- Flower nodeboxes
default.node_box.flower_high = nodebox({-0.15, -0.5, -0.15, 0.15, 0.3, 0.15})
default.node_box.flower_normal = nodebox({-0.15, -0.5, -0.15, 0.15, 0.2, 0.15})
default.node_box.flower_wide = nodebox({-0.5, -0.5, -0.5, 0.5, -0.2, 0.5})

-- Mushrooms
default.node_box.mushroom_normal = nodebox({
	{-1/16, -8/16, -1/16, 1/16, -6/16, 1/16},
	{-3/16, -6/16, -3/16, 3/16, -5/16, 3/16},
	{-4/16, -5/16, -4/16, 4/16, -4/16, 4/16},
	{-3/16, -4/16, -3/16, 3/16, -3/16, 3/16},
	{-2/16, -3/16, -2/16, 2/16, -2/16, 2/16},
})
default.node_box.mushroom_select = nodebox({-0.3, -0.5, -0.3, 0.3, 0, 0.3})

