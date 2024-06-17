extends Node

@export var moving_light : SpotLight3D
@export var stat_light : OmniLight3D # stat for stationary

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	elif event.is_action_pressed("moving_light_toggle"):
		moving_light.visible = !moving_light.visible
	elif event.is_action_pressed("stat_light_toggle"):
		stat_light.visible = !stat_light.visible
	elif event.is_action_pressed("stop_light"):
		moving_light.is_playing = !moving_light.is_playing
