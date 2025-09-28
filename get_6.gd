extends Sprite2D
var a = false
func _ready() -> void:
	if global_position.x > 100:
		for i in 50:
			$Timer.wait_time = 0.01
			$Timer.start()
			await $Timer.timeout
			global_position.x -= 30
	else:
		for i in 50:
			$Timer.wait_time = 0.01
			$Timer.start()
			await $Timer.timeout
			global_position.x += 30
	a=true


func _on_btn_mouse_entered() -> void:
	modulate = Color.DARK_GRAY


func _on_btn_mouse_exited() -> void:
	modulate = Color.WHITE


func _on_btn_pressed() -> void:
	number.crit += 1
	number.h+=1
	number.upgrades.insert(number.h,6)
	
	number.gte -= 1
	if get_parent().get_child(0)==self:
		get_parent().get_child(1).queue_free()
		queue_free()
	else:
		get_parent().get_child(0).queue_free()
		queue_free()
		
