extends Label

var coins = 0

func _ready():
	text = String(coins)

func _on_coin_coin_collected():
	coins += 1
	print(coins)
	_ready()
