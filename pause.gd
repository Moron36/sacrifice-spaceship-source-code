extends Node
var a = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and number.paus == false:
		if a==false:
			a=true
			get_tree().paused=true
			%fore.visible=true
		else:
			a=false
			get_tree().paused=false
			%fore.visible=false
	if Input.is_action_just_pressed("return") and a==true:
		get_tree().paused=false
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
