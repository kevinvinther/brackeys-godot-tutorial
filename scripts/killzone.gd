extends Area2D

@onready var timer: Timer = $Timer
@onready var you_died: Label = $"/root/Game/Labels/YouDied"
@onready var camera_2d: Camera2D = $"/root/Game/Player/PlayerCamera"

var dead = false

func center_label():
	var camera_position : Vector2 = camera_2d.get_screen_center_position()
	var label_size = you_died.get_minimum_size()
	you_died.set_position((camera_position - (label_size/2)))
	

func _on_body_entered(body: Node2D) -> void:
	print("You died")
	dead = true
	you_died.text = "You Died"
	center_label()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _process(delta: float) -> void:
	if dead:
		center_label()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
