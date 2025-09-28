extends Sprite2D
var shoot = load("res://scenes/enbull.tscn")
func _ready() -> void:
	while self!=null:
		$Timer.wait_time = 7
		$Timer.start()
		await $Timer.timeout
		for i in 3:
			var z = shoot.instantiate()
			z.global_position = global_position
			z.linear_velocity = Vector2(2500,0).rotated(get_angle_to(number.plr.global_position))
			get_tree().current_scene.get_child(2).add_child(z)
			$shoot.play()
			$Timer.wait_time = 0.25
			$Timer.start()
			await $Timer.timeout
		
