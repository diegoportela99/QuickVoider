extends Node2D

const _enemy = preload("res://Assets/Enemy/Enemy.tscn")

const screen_x = 88
const screen_y = 160

var enemys_spawned = 0
var enemy_count = 5

#causes random delta time
func _ready():
	randomize()
	randi()%11

func _process(delta):
	despawn()
	while(get_child_count() < enemy_count):
		spawn()
		print(enemys_spawned)

func spawn():
	var enemy = _enemy.instance()
	var pos = Vector2()
	
	pos.x = rand_range(-screen_x, screen_x)
	pos.y = rand_range(-screen_y, screen_y)
	
	var gradient = pos.y/pos.x
	
	var desired_x = screen_x+10
	var desired_y = screen_y+10
	
	#define lines
	var x_pos = 176
	var y_pos = 330
	
	var changed = false
	#check which line intercept
	#x = y/m
	if gradient > y_pos/x_pos:
		if pos.x > 0:
			pos.x = -desired_y/gradient
			changed = true
			pass
		else:
			pos.x = desired_y/gradient
			changed = true
			pass
	elif gradient < -(y_pos/x_pos):
		if pos.x > 0:
			pos.x = desired_y/gradient
			changed = true
			pass
		else:
			pos.x = -desired_y/gradient
			changed = true
			pass
	
	if !changed:
		if pos.x < 0:
			pos.x = -desired_x
		else:
			pos.x = desired_x
	
	pos.y = pos.x*gradient
	enemy.position = pos
	
	self.add_child(enemy)
	enemys_spawned+=1
	
	enemy.connect("collided", self, "handle_collision")
	
	enemy.look_at(get_parent().get_node("Player/PlayerProtect").position)
	enemy._set_rotation()

func timer():
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()

func despawn():
	for enemy in get_children():
		if enemy.position.x > screen_x*1.75 or enemy.position.x < -screen_x*1.75 or enemy.position.y > screen_y*1.75 or enemy.position.y < -screen_y*1.75:
			remove_child(enemy)

func handle_collision(collision):
	print(collision.collider.name)