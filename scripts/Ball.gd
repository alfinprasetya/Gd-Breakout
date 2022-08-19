extends KinematicBody2D

signal hit_wall
signal hit_player

onready var Player = get_parent().get_node("Player")
onready var Wall = {
	top = get_parent().get_node("Wall").get_node("Wall_Top"),
	left = get_parent().get_node("Wall").get_node("Wall_Left"),
	right = get_parent().get_node("Wall").get_node("Wall_Right")
}

export var speed = 100

var _direction = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	var _velocity = speed * _direction.normalized() * delta
	var _collision = move_and_collide(_velocity)
	
	if _collision:
		_direction = _direction.bounce(_collision.normal)
		
		if (_collision.collider == Wall.top or 
			_collision.collider == Wall.left or
			_collision.collider == Wall.right):
			emit_signal("hit_wall")
		
		if _collision.collider == Player:
			emit_signal("hit_player")

func serve():
		_direction.x = rand_range(-1, 1)
		_direction.y = -1
