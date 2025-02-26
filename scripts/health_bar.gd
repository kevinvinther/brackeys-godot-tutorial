extends ProgressBar

@onready var damage_bar: ProgressBar = $DamageBar
@onready var timer: Timer = $Timer

var current_health: int

var health: int : 
	set(value):
		change_health(value)
	get: 
		return current_health
	

func init_health_bar(initial_health: int, max_health: int):
	# Max value is 999 which is occupied by the "You Died" text.
	z_index = 998 # Should be on top
	damage_bar.z_index = 997  # Should be below
	health = initial_health
	max_value = max_health
	damage_bar.value = health 
	damage_bar.max_value = max_health

func change_health(new_health):
	var prev_health = current_health
	current_health = min(max_value, new_health)
	value = current_health
	
	if current_health == 0:
		queue_free()
		
	if current_health < prev_health:
		timer.start()
	else:
		damage_bar.value = current_health

func _on_timer_timeout() -> void:
	damage_bar.value = health
