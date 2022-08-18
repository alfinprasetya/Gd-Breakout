extends KinematicBody2D

var speed = 200

var _velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	# Get direction from user input
	var _horizontal_direction = sign(
		Input.get_action_strength("ui_right") 
		- Input.get_action_strength("ui_left")
	)
	
	# Calculate velocity
	_velocity.x = _horizontal_direction * speed
	
	_velocity = move_and_slide(_velocity)
