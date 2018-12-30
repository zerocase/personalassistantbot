extends KinematicBody2D
export (int) var gravity = 900
export (int) var jump_speed =-200
export (int) var move_speed = 100

var velocity = Vector2()
var jumping = false
var jump_count = 2
var pcubolds_collected = 0
const MIN_JUMP_COUNT = 0
func get_input():
	velocity.x=0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump_press = Input.is_action_just_pressed('ui_jump')
	if pcubolds_collected!= 0:
		if jump_count > MIN_JUMP_COUNT and jump_press:
			get_owner().cubolds_collected -=1
			jump_count -=1
			velocity.y = jump_speed
		if is_on_floor() and not jump_press :
			jump_count=2
	if right:
		velocity.x += move_speed
	if left:
		velocity.x -= move_speed
	else:
		_player_death()

func _physics_process(delta):
	if get_owner()!= null:
		pcubolds_collected = get_owner().cubolds_collected
	$Label.text = str(jump_count)
	get_input()
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _player_death():
	pass
