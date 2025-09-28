extends RigidBody2D
var a = number.pir

func _on_bltar_area_entered(area: Area2D) -> void:
	if area.get_parent() != get_parent():
		queue_free()


func _on_bltar_body_entered(body: Node2D) -> void:
	if body.inv == false:
		body.get_child(4).play()
		body.inv=true
		body.hp -= 1
		queue_free()
