extends Area2D
func _physics_process(delta: float) -> void:
	if number.aura == 0:
		visible = false
	else:
		visible = true
func _ready() -> void:
	while 1==1:
		if number.aura != 0:
			$Timer.wait_time = 0.75
			$Timer.start()
			await $Timer.timeout
			$ring.visible=true
			monitoring = true
			$Timer.wait_time = 0.25
			$Timer.start()
			await $Timer.timeout
			monitoring = false
			$ring.visible=false
		else:
			await get_tree().physics_frame


func _on_body_entered(body: Node2D) -> void:
	if visible==true and $ring.visible == true:
		$aurahit.play()
		body.hp -= number.aura + 1
