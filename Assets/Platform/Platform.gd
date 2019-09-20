extends StaticBody2D

var RotateSpeed = 0
var Radius = 30
var _centre
var _angle = 0
var _set_rotation = 0
var max_rotate_speed = 5

var game_lost = false

func _ready():
	set_process(true)
	_centre = self.position

func _process(delta):
	_angle += RotateSpeed * delta; #angle based on touch...
	var offset = Vector2(sin(_angle), cos(_angle)) * Radius;
	var pos = _centre + offset
	self.position = (pos)
	self.look_at(_centre)

func _set_rotate_speed(rotate_speed):
	if rotate_speed >= max_rotate_speed:
		rotate_speed = max_rotate_speed
	elif rotate_speed <= -max_rotate_speed:
		rotate_speed = -max_rotate_speed
	else:
		self.RotateSpeed = rotate_speed