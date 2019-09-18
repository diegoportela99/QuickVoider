extends KinematicBody2D

signal collided

export (int) var speed = 175
var velocity = Vector2()

func _ready():
	velocity = Vector2(0,1)

func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		emit_signal('collided', collision_info)