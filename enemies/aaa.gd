extends Sprite2D
var shoot = load("res://scenes/enbull.tscn")
func _ready() -> void:
	while self!=null:
		$Timer.wait_time = 2
		$Timer.start()
		await $Timer.timeout
		var z = shoot.instantiate()
		z.global_position = global_position
		z.linear_velocity = Vector2(0,2500)
		get_tree().current_scene.get_child(2).add_child(z)
		var z1 = shoot.instantiate()
		z1.global_position = global_position
		z1.linear_velocity = Vector2(0,-2500)
		get_tree().current_scene.get_child(2).add_child(z1)
		$shoot.play()
		$Timer.wait_time = 0.25
		$Timer.start()
		await $Timer.timeout
		
