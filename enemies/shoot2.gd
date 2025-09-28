extends Sprite2D
var shoot = load("res://scenes/enbull.tscn")
func _ready() -> void:
	while self!=null:
		$Timer.wait_time = 4
		$Timer.start()
		await $Timer.timeout
		var z = shoot.instantiate()
		z.global_position = global_position
		z.modulate = Color.RED
		get_tree().current_scene.get_child(2).add_child(z)
		var z1 = shoot.instantiate()
		z1.modulate = Color.RED
		z1.global_position = global_position
		z1.linear_velocity=Vector2(2000,0)
		get_tree().current_scene.get_child(2).add_child(z1)
		var z2 = shoot.instantiate()
		z2.modulate = Color.RED
		z2.global_position = global_position
		z2.linear_velocity=Vector2(0,2000)
		get_tree().current_scene.get_child(2).add_child(z2)
		var z3 = shoot.instantiate()
		z3.modulate = Color.RED
		z3.global_position = global_position
		z3.linear_velocity=Vector2(0,-2000)
		get_tree().current_scene.get_child(2).add_child(z3)
		$shoot.play()
