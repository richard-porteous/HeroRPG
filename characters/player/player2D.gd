extends KinematicBody2D

export (int) var speed = 200
var multiplier = 1
onready var _animated_sprite = $AnimatedSprite
var last_mouse_pos = null

var velocity = Vector2()

func get_input():
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("run"):
		multiplier = 1.5


func _input(event):
	if event is InputEventMouseButton:
		last_mouse_pos = get_global_mouse_position() #event.position #get_viewport().get_mouse_position()

func _physics_process(delta):

	velocity = Vector2()
	multiplier = 1

	if last_mouse_pos:
		velocity = last_mouse_pos - global_position
		if velocity.length() < 3:
			last_mouse_pos = null
			return
	else:
		get_input()
		
	var anim = "default" # or "idle" if you renamed
	_animated_sprite.flip_h = false
	
	#Direction Code
	if abs(velocity.y) > abs(velocity.x):
		if velocity.y > 0:
			anim = "down"
		elif velocity.y < 0:
			anim = "up"
	else:
		if velocity.x < 0:
			anim = "left_right"
			_animated_sprite.flip_h = true
		elif velocity.x > 0:
			anim = "left_right"
	
	if _animated_sprite.animation != anim:
		_animated_sprite.stop()

	_animated_sprite.play(anim)

	velocity = velocity.normalized() * speed * multiplier

	velocity = move_and_slide(velocity)
	if get_slide_count() > 0:
		last_mouse_pos = null
	

