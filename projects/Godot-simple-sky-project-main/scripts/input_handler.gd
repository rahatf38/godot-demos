extends Node

@export var main : Node3D
@export var can_uni_reset = true
signal uni_reset_signal
@export var anim : AnimationPlayer
@export var horse : Sprite3D
var menu_closed = false

func _ready() -> void:
	main = get_tree().get_root().get_node("Main")
	anim = main.get_node("AnimationPlayer")

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_action_pressed("uni_reset"):
		if menu_closed and can_uni_reset:
			uni_reset()

func uni_reset():
	emit_signal("uni_reset_signal")
	can_uni_reset = false
	anim.play("RESET")	
	anim.play("speedup")


func _on_u_character_body_3d_sliding(d) -> void:
	if d:
		can_uni_reset = false
	elif !d:
		can_uni_reset = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "speedup":
		get_tree().reload_current_scene()


func _on_ui_handler_menu_closed() -> void:
	menu_closed = true
