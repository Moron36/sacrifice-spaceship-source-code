extends RigidBody2D
var speed = 840
var tier = 0
var exp = load("res://scenes/explode.tscn")
var red = false
var a = deg_to_rad(180)
var hp = 10
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
		$crshsprt.modulate=Color.DARK_GRAY
		$Timer2.wait_time = 0.15
		$Timer2.start()
		await $Timer2.timeout
		$crshsprt.modulate=Color.WHITE
		
	if hp <= 0:
		var e = exp.instantiate()
		e.global_position = global_position
		number.els.add_child(e)
		number.n -= 10
		number.score += 10
		queue_free()
	if red==true:
		linear_velocity = Vector2(speed,0).rotated(a)
		a = lerp_angle(a, get_angle_to(number.plr.global_position),0.06)


func _on_hurtar_body_entered(body: Node2D) -> void:
	if body==number.plr:
		if body.inv==false:
			body.get_child(4).play()
			body.hp -= 1
			
			body.inv=true
		speed = -1200
		$Timer.wait_time = 0.3
		$Timer.start()
		await $Timer.timeout
		speed = 840
