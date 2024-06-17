extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://node_3d.tscn")
