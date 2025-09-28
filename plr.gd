extends CharacterBody2D
var speed = 1000
var deb = false
var inv = false
var deb2 = false
var hp = 5
var blt = load("res://scenes/bullet.tscn")
var whe = 10
func get_input():
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * speed
func _ready() -> void:
	number.plr = self
func _process(delta: float) -> void:
	if inv==true and deb2==false:
			deb2=true
			$Plrsprt.self_modulate = Color.LIGHT_CORAL
			$tim2.wait_time = 3
			$tim2.start()
			await $tim2.timeout
			deb2=false
			inv=false
			$Plrsprt.self_modulate = Color.WHITE
	
func _physics_process(delta: float) -> void:
	if get_tree().paused == false:
		speed = number.speed
		if hp<=0:
			number.reset()
			number.death = 1
			get_tree().reload_current_scene()
		get_input()
		move_and_slide()
		
		if Input.is_action_pressed("shoot") and deb==false:
			deb=true
			$shsfx.play()
			if number.bomb>0:
				whe-=1
				if whe==0:
					whe=10
					var c = load("res://scenes/bomb.tscn").instantiate()
					c.global_position=global_position
					%bullets.add_child(c)
			var e = blt.instantiate()
			e.global_position = global_position
			e.global_position.y += 20
			%bullets.add_child(e)
			var e2 = blt.instantiate()
			e2.global_position = global_position
			e2.global_position.y -= 20
			%bullets.add_child(e2)
			for i in number.ran:
				var p = blt.instantiate()
				p.global_position = global_position
				var s = deg_to_rad(randi_range(-360,360))
				p.linear_velocity = Vector2(2500,0).rotated(s)
				p.global_rotation = s
				%bullets.add_child(p)
			$tim.wait_time = number.rate
			$tim.start()
			await $tim.timeout
			deb=false
		
