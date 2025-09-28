extends Node2D
var max=5
var tiers = 0
func _ready() -> void:
	number.els = %else
	while 1==1:
		$wavetimer.wait_time = randi_range(1,3)
		number.els = %else
		$wavetimer.start()
		await $wavetimer.timeout
		for i in randi_range(1+tiers/5,4+tiers/3):
			var en = load("res://enemies/enemy"+str(randi_range(1,max))+".tscn").instantiate()
			while en.tier > tiers:
				en = load("res://enemies/enemy"+str(randi_range(1,max))+".tscn").instantiate()
			en.global_position = Vector2(1710,randi_range(-900,900))
			%enemies.add_child(en)
		$wavetimer.wait_time = randi_range(5,6)
		$wavetimer.start()
		await $wavetimer.timeout
		tiers += randi_range(1,2)-1
