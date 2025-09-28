extends Sprite2D

func _process(delta: float) -> void:
	if global_position.x > -3200:
		global_position.x -= 6
	else:
		global_position.x = 3200
