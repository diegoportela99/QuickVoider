extends KinematicBody2D

signal collided

export (int) var speed = 60
var velocity = Vector2(0, 1)

var hit = false

enum type {
		bad_type_1, #color red -> hit away = points
		good_type_1, #color blue
		powerup_type_1, #color green
		powerup_type_2, #color orange
		powerup_type_3 #color purple
	}

func _ready():
	_set_rotation()
	hide()

var loaded = 0
func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		emit_signal('collided', collision_info)

	
	#dodgy way of showing each enemy without spawning the line.. 
	if loaded < 15:
		loaded+=1
	else:
		show()

func _set_rotation():
	velocity = velocity.rotated(rotation) * speed

func show():
	self.visible = true

func hide():
	self.visible = false

func particle_effect(): #destroy self / create particles
	pass