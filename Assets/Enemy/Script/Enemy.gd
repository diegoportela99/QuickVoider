extends KinematicBody2D

signal collided

export (int) var speed = 60
var velocity = Vector2(0, 1)

func _ready():
	_set_rotation()

func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		emit_signal('collided', collision_info)

func _set_rotation():
	velocity = velocity.rotated(rotation) * speed
