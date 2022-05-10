extends Camera2D
onready var player = get_node("/root/Node2D/YSort/Player")


func _physics_process(_delta):
	position.x = player.position.x
		
