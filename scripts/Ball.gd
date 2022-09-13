extends KinematicBody2D

signal hit_wall
signal hit_brick
signal hit_player

onready var Player = get_parent().get_node("Player")
onready var Brick = get_parent().get_node("Brick")
onready var Wall = {
	top = get_parent().get_node("Wall").get_node("Wall_Top"),
	left = get_parent().get_node("Wall").get_node("Wall_Left"),
	right = get_parent().get_node("Wall").get_node("Wall_Right")
}

export var speed = 150

var _direction = Vector2.ZERO

func _physics_process(delta):
	var _velocity = speed * _direction.normalized() * delta
	var _collision = move_and_collide(_velocity)
	
	if _collision:
		_direction = _direction.bounce(_collision.normal)
		
		if _collision.collider in Wall.values():
			emit_signal("hit_wall")
		if _collision.collider == Brick:
			emit_signal("hit_brick")
		if _collision.collider == Player:
			emit_signal("hit_player")
			_direction.x = get_x_bounce_direction(_collision)

func get_x_bounce_direction(collision: KinematicCollision2D):
	var relative_x = collision.position.x - Player.position.x
	var percentage = relative_x / (Player._length / 2)
	return percentage

func serve():
		_direction.x = rand_range(-1, 1)
		_direction.y = -1
