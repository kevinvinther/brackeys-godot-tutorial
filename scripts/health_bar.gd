extends ProgressBar

@onready var damage_bar: ProgressBar = $DamageBar
@onready var timer: Timer = $Timer

var _health: int

var health: int : 
	set(value):
		change_health(value)
	get: 
		return _health
	

func init_health_bar(_health: int, _max_health: int):
	z_index = 998  # Should be on top
	damage_bar.z_index = 997  # Should be below
	health = _health
	max_value = _max_health
	damage_bar.value = health 
	damage_bar.max_value = _max_health

func change_health(new_health):
	var prev_health = _health
	_health = min(max_value, new_health)
	value = _health
	
	if _health == 0:
		queue_free()
		
	if _health < prev_health:
		timer.start()
	else:
		damage_bar.value = _health

func _on_timer_timeout() -> void:
	damage_bar.value = health
