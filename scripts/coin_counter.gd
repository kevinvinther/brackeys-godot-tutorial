extends Control

@onready var coin: Sprite2D = $Coin
@onready var coin_amount: Label = $CoinAmount

var _coins: int = 0

var coins: int:
	set(value):
		_change_coins_value(value)
	get:
		return _coins
		

func _change_coins_value(value):
	coin_amount.text = str(value)
	_coins = value
