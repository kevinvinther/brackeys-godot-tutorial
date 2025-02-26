extends Area2D

@onready var timer: Timer = $Timer
@onready var you_died: Label = $"/root/Game/Labels/YouDied"
@onready var camera_2d: Camera2D = $"/root/Game/Player/PlayerCamera"

@export var damage: int

var dead = false

func center_label():
	var camera_position : Vector2 = camera_2d.get_screen_center_position()
	var label_size = you_died.get_minimum_size()
	you_died.set_position((camera_position - (label_size/2)))
	

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var player: Player = body
		print("Body is a ", body.name)
		player.take_damage(damage)
		print("Player took ", damage, " damage. Now at ", player.health, " health.")
		if player.health == 0:
			dead = true
			you_died.text = "You Died"
			you_died.z_index = 999
			center_label()
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer.start()
	else: 
		print("Hmmm. Something other than the player was damaged. Body type: ", body.name)
	
	
func _process(_delta: float) -> void:
	if dead:
		center_label()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
