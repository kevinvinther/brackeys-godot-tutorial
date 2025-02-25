extends CanvasLayer

@onready var coin_counter: Control = $CoinCounter

func add_coins(value):
	coin_counter.coins += value
	
