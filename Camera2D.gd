extends Camera2D
onready var player = get_node("/root/Node2D/Player")

func _ready():
	pass

func _physics_process(_delta):
	position = player.position
		
