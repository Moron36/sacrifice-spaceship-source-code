extends Sprite2D

func _process(delta: float) -> void:
	for i in get_child_count():
		print(get_child(i))
