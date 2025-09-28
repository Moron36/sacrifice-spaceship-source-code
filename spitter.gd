extends RigidBody2D

var tier = 1
var exp = load("res://scenes/explode.tscn")
var col = false
var red = false
var deb = true
var hp = 7
var a = 0
var b = 0
var c = 0
func _ready() -> void:
	for i in 120:
		$Timer.wait_time = 0.01
		$Timer.start()
		await $Timer.timeout
		global_position.x -= 2
	red=true
	
func _process(delta: float) -> void:
	linear_velocity = Vector2(a,b)
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
		number.score += 8
		number.n -= 8
		queue_free()
	if red==true and deb==true:
		deb=false
		c=randi_range(1,70)
		$Timer.wait_time = 0.5
		$Timer.start()
		await $Timer.timeout
		if c>=40:
			a=-500
		if c<40 && c>=25:
			b=-400
		if c>10 && c<=25:
			b=400
		if c<=10:
			a=250
		if global_position.y < -930:
			b=700
		if global_position.y > 930:
			b=-700
		if global_position.x < -1670:
			a=-800
		$Timer.wait_time = 0.5
		$Timer.start()
		await $Timer.timeout
		a=0
		b=0
		$Timer.wait_time = 1.5
		$Timer.start()
		await $Timer.timeout
		deb=true


func _on_hurtar_body_entered(body: Node2D) -> void:
	if body==number.plr:
		if body.inv==false:
			body.get_child(4).play()
			body.hp -= 1
			body.inv=true
