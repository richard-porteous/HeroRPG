extends KinematicBody

export (int) var speed = 200
var multiplier = 1
onready var _animated_sprite = $AnimatedSprite
var last_mouse_pos = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
