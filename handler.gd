extends Node
var max = 8
var can = true
var deb = true

func _ready() -> void:
	while 1==1:
		if can==true and %pause.a==false:
			$Timer.wait_time = 1
			$Timer.start()
			await $Timer.timeout
			number.score += 1
			number.n-=1
		else:
			await get_tree().process_frame

func _process(delta: float) -> void:
	if get_tree().paused == true and number.gte==-1:
		number.upgrades.shuffle()
		var k = 100
		while number.upgrades[0]==number.upgrades[1] and k>0:
			k-=1
			number.upgrades.shuffle()
		%bless.visible = false
		%curse.visible = true
		number.gte=-2
		%m.play()
		var r1 = load("res://rids/rid"+str(number.upgrades[0])+".tscn").instantiate()
		r1.b=0
		r1.global_position = %loc1.global_position
		$things.add_child(r1)
		var r2 = load("res://rids/rid"+str(number.upgrades[1])+".tscn").instantiate()
		r2.b=1
		r2.global_position = %loc2.global_position
		$things.add_child(r2)
	if get_tree().paused == true and number.gte==2:
		%m2.play()
		number.gte=0
		var a1 = randi_range(1,max)
		var a2 = randi_range(1,max)
		while a2==a1:
			a2=randi_range(1,max)
		var c1 = load("res://get/get"+str(a2)+".tscn").instantiate()
		c1.global_position = %loc1.global_position
		$things.add_child(c1)
		var c2 = load("res://get/get"+str(a1)+".tscn").instantiate()
		c2.global_position = %loc2.global_position
		$things.add_child(c2)
	if get_tree().paused == false and deb==false:
		deb=true
		can=true
		%plr.inv=true
		number.paus = false
		%curse.visible = false
		number.m+=25
		number.n=100+number.m
		get_tree().paused = false
		%fore.visible = false
	if number.n<=0 and deb == true:
		var a1 = randi_range(1,max)
		var a2 = randi_range(1,max)
		while a2==a1:
			a2=randi_range(1,max)
		%bless.visible = true
		%m2.play()
		%timer.text = "next selection in: 0"
		number.paus = true
		can = false
		deb = false
		%fore.visible = true
		get_tree().paused = true
		number.gte = 3
		var c1 = load("res://get/get"+str(a1)+".tscn").instantiate()
		c1.global_position = %loc1.global_position
		$things.add_child(c1)
		var c2 = load("res://get/get"+str(a2)+".tscn").instantiate()
		c2.global_position = %loc2.global_position
		$things.add_child(c2)
