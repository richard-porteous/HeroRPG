extends Camera2D
onready var player = get_node("/root/Node2D/Player")

#func _ready():
#	position.y = player.position.y
	

func _physics_process(_delta):
	position.x = player.position.x
	print (position)
		
