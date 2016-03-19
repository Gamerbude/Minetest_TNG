plants = {}

-- the growing time factor decides how long every plant needs to grow 1.0 (normal), 0.75 (faster), 1.25 (slower)
-- not used at the moment
plants.growtime_factor = core.setting_get ("plants_growtime_factor") or 1.0

-- execute all files
plants.path = core.get_modpath("plants")

-- Food
dofile (plants.path .. "/lua/food/pear.lua")

-- Plants
dofile (plants.path .. "/lua/plants/vines.lua")
