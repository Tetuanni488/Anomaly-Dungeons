extends KinematicBody

const PLAYER_SPEED = 6

var player = {
	velocity = Vector3(0,0,0)
}

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		player.velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		player.velocity.x = PLAYER_SPEED
	elif Input.is_action_pressed("ui_left"):
		player.velocity.x = -PLAYER_SPEED
	else:
		player.velocity.x = lerp(player.velocity.x,0,0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		player.velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		player.velocity.z = -PLAYER_SPEED
	elif Input.is_action_pressed("ui_down"):
		player.velocity.z = PLAYER_SPEED
	else:
		player.velocity.z = lerp(player.velocity.z,0,0.1)
	
	move_and_slide(player.velocity)
