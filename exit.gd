extends Button


func _on_mouse_exited() -> void:
	modulate = Color.WHITE


func _on_mouse_entered() -> void:
	modulate = Color.DARK_GRAY


func _on_pressed() -> void:
	get_tree().quit()
