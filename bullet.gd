extends RigidBody2D
var a = number.pir
var c = 0
func _on_bltar_area_entered(area: Area2D) -> void:
	if area.get_parent() != get_parent():
		queue_free()


func _on_bltar_body_entered(body: Node2D) -> void:
	if body.red == true:
		get_parent().get_child(0).play()
		c=randi_range(1,8)
		if body!=null:
			body.col=true
		if c==1:
			body.hp -= number.dmg * number.crit
		else:
			body.hp -= number.dmg
		a-=1
		if a<0:
			queue_free()
