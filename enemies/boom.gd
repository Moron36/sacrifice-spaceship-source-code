extends Area2D

func _ready() -> void:
	$explosion.play()
	$eb.play()
	$Timer.wait_time = 0.5
	$Timer.start()
	await $Timer.timeout
	queue_free()

func _physics_process(delta: float) -> void:
	global_position.x-=15

func _on_body_entered(body: Node2D) -> void:
	body.hp-=number.bomb*number.crit+1
	body.col = true
