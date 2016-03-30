function default.register_fence(itemstring, def)
	local fence_texture_1 = "default_fence_overlay.png^"
	local fence_texture_2 = "^default_fence_overlay.png^[makealpha:255,126,126"

	if not def.groups then
		def.groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fuel = 3}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end
	def.groups.fence = 1
	def.drawtype = "fencelike"
	def.tiles = def.tiles or {def.texture}
	def.inventory_image = fence_texture_1 .. def.texture .. fence_texture_2
	def.wield_image = fence_texture_1 .. def.texture .. fence_texture_2
	def.paramtype = "light"
	def.sunlight_propagates = true
	def.is_ground_content = false
	def.selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	}
	def.stack_max = default.STACK_MAX

	core.register_node(itemstring, def)

	if not def.no_craft then
		core.register_craft({
			output = itemstring .. " 6",
			recipe = {
				{def.material, "group:stick", def.material},
				{def.material, "group:stick", def.material},
			}
		})
	end
end

local compatible = core.setting_getbool("enable_legacy_support") or true
if compatible then
	-- these nodes were named wrong first
	core.register_alias("default:fence_pinewood", "default:fence_pine_wood")
	core.register_alias("default:fence_acaciawood", "default:fence_acacia_wood")
	core.register_alias("default:fence_birchwood", "default:fence_birch_wood")
end