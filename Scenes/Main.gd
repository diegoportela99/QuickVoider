extends Node2D

#offset for finger movement to the platform rotation speed
var offset = 20

var dt = 0
var last_dt
var first = Vector2(0,0)
var last = Vector2(0,0)

func _process(delta):
	if first.y != 0 and last.y != 0:
		dt = 1-(first.y/last.y)
		$CanvasLayer/GridContainer/dt_label.text = str($EnemySpawner.enemys_spawned)
	$Player/Platform._set_rotate_speed((first.y-last.y)/offset)

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			first = get_global_mouse_position()
	
	if event is InputEventMouseMotion:
		last = get_global_mouse_position()