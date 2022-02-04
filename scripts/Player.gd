extends KinematicBody

const PLAYER_SPEED = 6
const ROT_SPEED = 7

signal life_changed

var player = {
	velocity = Vector3(0,0,0),
	lifes = 3
}

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		player.velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		player.velocity.x = PLAYER_SPEED
		$MeshInstance.rotate_x(deg2rad(ROT_SPEED))
	elif Input.is_action_pressed("ui_left"):
		player.velocity.x = -PLAYER_SPEED
		$MeshInstance.rotate_x(deg2rad(-ROT_SPEED))
	else:
		player.velocity.x = lerp(player.velocity.x,0,0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		player.velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		player.velocity.z = -PLAYER_SPEED
		$MeshInstance.rotate_z(deg2rad(-ROT_SPEED))
	elif Input.is_action_pressed("ui_down"):
		player.velocity.z = PLAYER_SPEED
		$MeshInstance.rotate_z(deg2rad(ROT_SPEED))
	else:
		player.velocity.z = lerp(player.velocity.z,0,0.1)
		
	
	move_and_slide(player.velocity)


func _on_virus_body_entered(body):
	if body.name == "Player":
		player.lifes -= 1
		emit_signal("life_changed",player.lifes)
		if player.lifes == 0:
			get_tree().change_scene("res://gameOver.tscn")
