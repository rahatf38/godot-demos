extends Node

var progressbar : ProgressBar
var counter : Label
var main : Node3D
var time_scale : float
var label : Label
signal menu_closed

func _ready() -> void:
	progressbar = get_node("ProgressBar")
	counter = get_node("fps_counter")
	main = get_tree().get_root().get_node("Main")
	label = get_node("Label")

func _input(event):
	if event.is_action_pressed("close_menu"):
		label.visible = false
		emit_signal("menu_closed")

func _process(_delta: float) -> void:
	time_scale = main.time_scale
	counter.set_text("%d FPS" % Engine.get_frames_per_second())
	progressbar.value = time_scale
