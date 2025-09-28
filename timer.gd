extends Label

func _physics_process(delta: float) -> void:
	text = "next selection in: "+str(number.n)
