extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel
@onready var coins: Node = $"../Coins"

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " out of " + str(coins.get_child_count()) + " coins."
