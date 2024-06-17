#-1 -75
extends SpotLight3D

# Configuration
@export_group("properties")
@export	var min_angle = -65
@export	var max_angle = -1
@export	var speed = 0.95	  # Speed of rotation (adjust as needed)
@export_group("")
var is_playing = true
# Internal variables
var current_angle = max_angle
var direction = 1  # 1 for clockwise, -1 for counterclockwise
var time_passed = 0.0

func _process(delta):
	# Only process if playing
	if is_playing:
		time_passed += delta * speed
		
		# Calculate the new angle using a sine wave
		var amplitude = (max_angle - min_angle) / 2.0
		var mid_angle = (max_angle + min_angle) / 2.0
		var current_angle = amplitude * sin(time_passed) + mid_angle
		
		# Apply rotation
		rotation_degrees.y = current_angle
