extends Node

var cubolds_total = 0
var cubolds_collected = 2

func _ready():
	pass

func _process(delta):
	get_node("PlayerChar/Sprite/Label").text = str(cubolds_collected)
