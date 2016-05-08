-- mods/default/legacy.lua

-- Horrible crap to support old code registering falling nodes
-- Don't use this and never do what this does, it's completely wrong!
-- (More specifically, the client and the C++ code doesn't get the group)
function default.register_falling_node(nodename, texture)
	core.log("error", debug.traceback())
	core.log('error', "WARNING: default.register_falling_node is deprecated")
	if core.registered_nodes[nodename] then
		core.registered_nodes[nodename].groups.falling_node = 1
	end
end

function default.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end

-- Liquids
WATER_ALPHA = core.registered_nodes["default:water_source"].alpha
WATER_VISC = core.registered_nodes["default:water_source"].liquid_viscosity
LAVA_VISC = core.registered_nodes["default:lava_source"].liquid_viscosity
LIGHT_MAX = default.LIGHT_MAX

-- Formspecs
default.gui_suvival_form = default.gui_survival_form


-- Old stairs and slabs API
stairs = {}

-- stairs
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	default.register_stair(":stairs:stair_" .. subname, {
		description = description,
		tiles = images,
		material = recipeitem,
		groups = groups,
		sounds = sounds
	})
end

-- slabs
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	default.register_slab(":stairs:slab_" .. subname, {
		description = description,
		tiles = images,
		material = recipeitem,
		groups = groups,
		sounds = sounds
	})
end

-- stairs and slabs
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end

core.register_alias("stairs:stair_pinewood", "default:stair_pine_wood")
core.register_alias("stairs:slab_pinewood", "default:slab_pine_wood")
