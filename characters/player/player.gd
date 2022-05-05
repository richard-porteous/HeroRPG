extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = $AnimatedSprite

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	var anim = "default" # or "idle" if you renamed
	_animated_sprite.flip_h = false
	
	if velocity.y > 0:
		anim = "down"
	elif velocity.y < 0:
		anim = "up"
	elif velocity.x < 0:
		anim = "left_right"
		_animated_sprite.flip_h = true
	elif velocity.x > 0:
		anim = "left_right"
	else:
		anim = "default"  # or "idle"
	
	if _animated_sprite.animation != anim:
		_animated_sprite.stop()

	_animated_sprite.play(anim)
	
	velocity = move_and_slide(velocity)
	
