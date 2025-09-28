extends RigidBody2D
var tier = 6
var exp = load("res://scenes/explode.tscn")
var speed = 450
var red = false
var deb = true
var hp = 14
var c = 0
var col = false
var a =false
func _ready() -> void:
	for i in 120:
		$Timer.wait_time = 0.01
		$Timer.start()
		await $Timer.timeout
		global_position.x -= 2
	red=true
	while self!=null:
		$Timer.wait_time = randi_range(3,4)
		$Timer.start()
		await $Timer.timeout
		c=get_angle_to(Vector2(randi_range(-500,500),(randi_range(-400,400))))
		a=true
		$Timer.wait_time = randi_range(1,2)
		$Timer.start()
		await $Timer.timeout
		a=false
		$Timer.wait_time = randi_range(3,5)
		$Timer.start()
		await $Timer.timeout
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
		number.score += 12
		number.n -= 12
		queue_free()
	if red==true:
		if a==true:
			linear_velocity=Vector2(speed,0).rotated(c)
		else:
			linear_velocity = Vector2(0,0)


func _on_hurtar_body_entered(body: Node2D) -> void:
	if body==number.plr:
		if body.inv==false:
			body.get_child(4).play()
			body.hp -= 1
			body.inv=true
