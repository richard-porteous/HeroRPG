extends KinematicBody

export (int) var speed = 2 #200
var multiplier = 1
onready var _animated_sprite = $AnimatedSprite
var last_mouse_pos = null
var velocity:Vector3 = Vector3.ZERO
var camera_angle = 90
var flip = true


#var flip

func get_input():
	
	if Input.is_action_pressed("right"):
		velocity += transform.basis.x
	if Input.is_action_pressed("left"):
		velocity += -transform.basis.x
	if Input.is_action_pressed("down"):
		velocity += transform.basis.z
	if Input.is_action_pressed("up"):
		velocity += -transform.basis.z
	if Input.is_action_pressed("run"):
		multiplier = 1.5
	if Input.is_action_just_pressed("flip"):
		flip != flip
		
#		if camera_angle > 0:
#			camera_angle = -90
#		else:
#			camera_angle = 90
#		$CameraHub.rotate_y(deg2rad(camera_angle))
#		$AnimatedSprite.rotate_y(deg2rad(camera_angle))

#func _input(event):
#	if event is InputEventMouseButton:
#		last_mouse_pos = get_global_mouse_position() #event.position #get_viewport().get_mouse_position()

func _process(delta):
#	if flip == true  && $CameraGimbal.rotation_degrees.y < camera_angle:
#		var la = lerp(0, camera_angle, delta)
#		$CameraGimbal.rotate_y($CameraGimbal.rotation_degrees.y-la)
#	elif flip == false  && $CameraGimbal.rotation_degrees.y > 0:
#		var la = lerp(camera_angle, 0, delta)
#		$CameraGimbal.rotate_y($CameraGimbal.rotation_degrees.y+la)

	var camera_pos = $CameraGimbal/InnerGimbal/Camera.global_transform.origin
	camera_pos.y = 0
	$AnimatedSprite.look_at(camera_pos, Vector3(0, 1, 0))
	
func _physics_process(delta):
	velocity = Vector3.ZERO
	multiplier = 1

#	if last_mouse_pos:
#		velocity = last_mouse_pos - global_position
#		if velocity.length() < 3:
#			last_mouse_pos = null
#			return
#	else:

	get_input()
		
	var anim = "default" # or "idle" if you renamed
	_animated_sprite.flip_h = false
	
	#Direction Code
	if abs(velocity.z) > abs(velocity.x):
		if velocity.z > 0:
			anim = "down"
		elif velocity.z < 0:
			anim = "up"
	else:
		if velocity.x < 0:
			anim = "left_right"
		elif velocity.x > 0:
			anim = "left_right"
			_animated_sprite.flip_h = true
	
	if _animated_sprite.animation != anim:
		_animated_sprite.stop()

	_animated_sprite.play(anim)

	velocity = velocity.normalized() * speed * multiplier

	velocity = move_and_slide(velocity)
	if get_slide_count() > 0:
		last_mouse_pos = null
	

