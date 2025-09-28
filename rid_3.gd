extends Sprite2D
var b = 0
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
	number.pir -= 1
	number.upgrades.remove_at(b)
	number.h-=1
	number.gte -= 1
	if number.gte <= 0:
		get_tree().paused=false
	if get_parent().get_child(0)==self:
		get_parent().get_child(1).queue_free()
		queue_free()
	else:
		get_parent().get_child(0).queue_free()
		queue_free()
		
