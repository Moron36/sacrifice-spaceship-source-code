extends Label

func _process(delta: float) -> void:
	if number.death == 1:
		number.death = 0
		visible=true
		$Timer.wait_time=1.5
		$Timer.start()
		await $Timer.timeout
		visible=false
