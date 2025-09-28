extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_mouse_entered() -> void:
	modulate = Color.DARK_GRAY


func _on_mouse_exited() -> void:
	modulate = Color.WHITE
