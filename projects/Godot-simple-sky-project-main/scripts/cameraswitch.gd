extends Node3D

var pucci_visible = false
var can_switch = true
@export var pucci : Sprite3D


func _input(event):
	if event.is_action_pressed("camera_switch") and can_switch:
		camera_switch()

func _process(_delta: float) -> void:
	if pucci_visible:
		pucci.visible = true
	else:
		pucci.visible = false


func _on_u_character_body_3d_in_cutscene_signal(d) -> void:
	if d:
		get_node("Camera").current = true
		pucci_visible = false
		can_switch = false
	else:
		can_switch = true
func camera_switch():
	pucci_visible = not pucci_visible
	get_node("Camera").current = !get_node("Camera").current
