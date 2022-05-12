extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Dialogue.visible = false


func _on_Area2D_body_entered(body):
	print("body entered", body.name)
	if (body.name == "Player"):
		$Dialogue.visible = true


func _on_Area2D_body_exited(body):
	#print("body exited", body.name)
	if (body.name == "Player"):
		$Dialogue.visible = false
	
