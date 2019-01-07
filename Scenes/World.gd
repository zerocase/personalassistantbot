extends Node

var cubolds_total = 0
var cubolds_collected = 2

func _ready():
	pass
	
func _input(event):
	var exit_key = Input.is_action_pressed("ui_cancel")
	if exit_key:
		get_tree().quit()

func _process(delta):
	get_node("PlayerChar/Sprite/Label").text = str(cubolds_collected)
