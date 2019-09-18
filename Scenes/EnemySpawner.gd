extends Node2D

var loaded = false
func _process(delta):
	if !loaded:
		for enemies in get_children():
			enemies.look_at(get_parent().get_node("Player/PlayerProtect").position)
			enemies._set_rotation()
		loaded = true
	else:
		self.visible = true

