extends KinematicBody2D

export var speed = 200
export (int, 1, 7) var player_length = 3

onready var player_map = $PlayerMap

var _horizontal_direction = 0
var _velocity = Vector2.ZERO
var _length = 0
var _is_dragging = false
var _touch_pos = 0

func _ready():
	build_player(player_length)

func build_player(length :int):
	assert(length >= 2, "ERROR: You must use length of at least 2 cells")
	player_map.clear()
	
	var left = 0
	var middle = 1
	var right = 2
	var x = 0
	
	player_map.set_cell(x, 0, left)
	for _i in range(1, length-1):
		x += 1
		player_map.set_cell(x, 0, middle)
	x += 1
	player_map.set_cell(x, 0, right)
	player_map.position.x = -(length*8)
	
	_length = length * 16 * scale.x

func _physics_process(_delta):
	if _is_dragging:
		var _x_dif = _touch_pos - position.x
		_horizontal_direction = sign(_x_dif) if abs(_x_dif) >= 2 else 0
	else:
		_horizontal_direction = sign(
			Input.get_action_strength("ui_right") 
			- Input.get_action_strength("ui_left")
		)
	
	# Calculate velocity
	_velocity.x = _horizontal_direction * speed
	_velocity.y = 0
	
	# Fixed player y position
	position.y = 320
	
	_velocity = move_and_slide(_velocity)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			_is_dragging = true
		else:
			_is_dragging = false
	
	if _is_dragging and event is InputEventMouse:
		_touch_pos = event.position.x
