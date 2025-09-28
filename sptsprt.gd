extends Sprite2D
var shoot = load("res://scenes/enbull.tscn")
func _ready() -> void:
	while self!=null:
		$Timer.wait_time = 3
		$Timer.start()
		await $Timer.timeout
		var z = shoot.instantiate()
		z.global_position = global_position
		get_tree().current_scene.get_child(2).add_child(z)
		$shoot.play()
