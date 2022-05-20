extends Camera

onready var player = get_node("/root/World/Player")

var distance_from_player:Vector3
var stop_camera = false

func _ready():
	distance_from_player = player.get_translation() - translation

	
func _physics_process(_delta):
	
	if abs(distance_from_player.x) > abs((player.get_translation() - translation).y):
		distance_from_player = player.get_translation() - translation
		
	var follow = player.transform.origin - distance_from_player
	
	transform.origin.x = follow.x
		
		
		
	

