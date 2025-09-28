extends RigidBody2D
var tier = 8
var exp = load("res://scenes/explode.tscn")
var speed = 605
var red = false
var deb = true
var hp = 11
var c = -1
var col = false
var a =false
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
		number.score += 9
		number.n -= 9
		queue_free()
	if red==true:
		if global_position.x < -1500:
			c=1
		else:
			if global_position.x > 1500:
				c=-1
		linear_velocity=Vector2(speed,0)*c


func _on_hurtar_body_entered(body: Node2D) -> void:
	if body==number.plr:
		if body.inv==false:
			body.get_child(4).play()
			body.hp -= 1
			body.inv=true
