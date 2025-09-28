extends GPUParticles2D

func _ready() -> void:
	one_shot = true
	global_position.x+=95
	$xplsfx.play()
	$Timer.wait_time = 15
	$Timer.start()
	await $Timer.timeout
	queue_free()
func _process(delta: float) -> void:
	global_position.x -= 15
