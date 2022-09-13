extends BaseScene

onready var Ball = $Ball
onready var Player = $Player
onready var HUD = $HUD

var _serve = true

func _ready() -> void:
	Ball.position.x = Player.position.x

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		change_scene("Titlescreen")
	
	if _serve:
		Ball.position.x = Player.position.x
		Ball.position.y = Player.position.y - 10
		if Input.is_action_just_pressed("ui_accept"):
			_serve = false
			Ball.serve()

func _on_Ball_hit_wall() -> void:
	play_sound("wall_hit")

func _on_Ball_hit_player() -> void:
	play_sound("paddle_hit")

func _on_Ball_hit_brick() -> void:
	play_sound("brick_hit_2")

func _on_Fallzone_body_entered(body):
	if body == Ball:
		_serve = true
		play_sound("hurt")
		HUD.health -= 1
		if HUD.health <= 0:
			change_scene("Gameover")
