extends StaticBody2D

var RotateSpeed = 3
var Radius = 40
var _centre
var _angle = 0
var _set_rotation = 0

func _ready():
	set_process(true)
	_centre = self.position

func _process(delta): 
	_angle += RotateSpeed * delta;
	var offset = Vector2(sin(_angle), cos(_angle)) * Radius;
	var pos = _centre + offset
	self.position = (pos)
	self.look_at(_centre)