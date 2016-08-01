-- mods/default/lua/apis/flowers.lua
-- =================================
-- See README.txt for licensing and other information.

function default.register_flower(name, def)
	def.description = def.description or "Flower"
	def.drawtype = def.drawtype or "plantlike"
	def.waving = def.waving or 1
	def.sunlight_propagates = true
	def.paramtype = "light"
	def.walkable = false
	def.buildable_to = true

	def.groups = def.groups or {}
	def.groups.snappy = def.groups.snappy or 3
	def.groups.flammable = def.groups.flammable or 2
	def.groups.flower =  1
	def.groups.flora = 1
	def.groups.attached_node = def.groups.attached_node or 1

	def.sounds = def.sounds or default.node_sound_leaves_defaults()

	def.selection_box = def.selection_box or default.node_box.flower_normal
	def.tiles = {def.texture}
	def.inventory_image = def.texture
	def.wield_image = def.texture

	-- clean up
	def.texture = nil

	-- register the node
	core.register_node(name, def)
end
