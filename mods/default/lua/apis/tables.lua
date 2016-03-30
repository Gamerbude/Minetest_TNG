function default.register_table(itemstring, def)
	local material = def.material
	
	-- set defaults if nothing is set already
	if not def.groups then
		def.groups = {choppy = 2, flammable = 2, oddly_breakable_by_hand = 2, fuel = 6}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end

	-- set table properties
        def.stack_max = default.STACK_MAX
	def.paramtype = "light"
	def.drawtype = "nodebox"
	def.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5},
			{-0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875}
		}
	}
	
	-- clean up variables
	def.material = nil
	
	-- register the table node
	minetest.register_node(itemstring, def)
	
	-- and register the crafting recipe
	minetest.register_craft({
		output = itemstring .. " 4",
		recipe = {
			{material, material, material},
			{   "",    material,    ""   },
			{   "",    material,    ""   },
		}
	})

end

local legacy = core.setting_getbool("enable_legacy_support") or true
if legacy then
	-- these nodes were named wrong first
	core.register_alias("default:table_pinewood", "default:table_pine_wood")
	core.register_alias("default:table_acaciawood", "default:table_acacia_wood")
	core.register_alias("default:table_birchwood", "default:table_birch_wood")
end