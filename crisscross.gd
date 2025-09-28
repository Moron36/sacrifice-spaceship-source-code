extends RigidBody2D
var tier = 10
var exp = load("res://scenes/explode.tscn")
var speed = 920
var red = false
var deb = true
var hp = 23
var c = 0
var col = false
func _ready() -> void:
	for i in 120:
		$Timer.wait_time = 0.01
		$Timer.start()
		await $Timer.timeout
		global_position.x -= 2
	red=true
	

func _process(delta: float) -> void:
	if col==true:
		col=false
		$sptsprt.modulate=Color.DARK_GRAY
		$Timer2.wait_time = 0.15
		$Timer2.start()
		await $Timer2.timeout
		$sptsprt.modulate=Color.WHITE
	if hp <= 0:
		var e = exp.instantiate()
		e.global_position = global_position
		number.els.add_child(e)
		number.score += 15
		number.n -= 15
		queue_free()
	if red==true and deb==true:
		deb=false
		$Timer.wait_time = 0.25
		$Timer.start()
		await $Timer.timeout
		linear_velocity = Vector2(speed,0).rotated(get_angle_to(number.plr.global_position)+deg_to_rad(randi_range(-30,30)))
		$Timer.wait_time = 0.5
		$Timer.start()
		await $Timer.timeout
		linear_velocity = Vector2(speed,0).rotated(get_angle_to(number.plr.global_position)+deg_to_rad(randi_range(-30,30)))
		$Timer.wait_time = 0.5
		$Timer.start()
		await $Timer.timeout
		linear_velocity = Vector2(0,0)
		$Timer.wait_time = 3.75
		$Timer.start()
		await $Timer.timeout
		deb=true


func _on_hurtar_body_entered(body: Node2D) -> void:
	if body==number.plr:
		if body.inv==false:
			body.get_child(4).play()
			body.hp -= 1
			body.inv=true
