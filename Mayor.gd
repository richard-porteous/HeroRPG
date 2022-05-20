extends KinematicBody

# Called when the node enters the scene tree for the first time.
func _ready():
	$SpeechBubble.visible = false


#func _on_Area_body_entered(body):
#	print("body entered", body.name)
#	if (body.name == "Player"):
#		$SpeechBubble/Dialogue.visible = true
#
#
#func _on_Area_body_exited(body):
#	#print("body exited", body.name)
#	if (body.name == "Player"):
#		$SpeechBubble/Dialogue.visible = false
	


func _on_Area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
#	print("body entered", area.name)
	if (area.name == "Player_talk"):
		$SpeechBubble.visible = true



func _on_Area_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
#	print("body exited", area.name)
	if (area.name == "Player_talk"):
		$SpeechBubble.visible = false

