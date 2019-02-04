extends Area2D

#BASE CUBOLD
export var value = 1

func _ready():
	$AnimationPlayer.play("rotation")
	if get_owner() != null:
		get_owner().cubolds_total += value


func _on_Cubold_body_entered(body):
	if body.is_in_group("pc"):
		_cubold_collected()
	if get_owner() != null:
		get_owner().cubolds_collected += value

func _cubold_collected():
	queue_free()