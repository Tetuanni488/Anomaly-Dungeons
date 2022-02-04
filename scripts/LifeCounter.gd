extends Label

var lifes = 3

func _ready():
	text = String(lifes)

func _on_Player_life_changed(_lifes):
	lifes = _lifes
	_ready()
