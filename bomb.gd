extends RigidBody2D
var a = load("res://enemies/boom.tscn")
func _ready() -> void:
	$bombsprt.play()
	for i in 7:
		$Timer.wait_time = 0.2
		$Timer.start()
		await $Timer.timeout
		$tick.play()
	var e = a.instantiate()
	e.global_position = global_position
	get_tree().current_scene.add_child(e)
	queue_free()
