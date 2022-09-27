extends BaseScene

export (int, 1, 4) var level = 1

onready var Ball = $Ball
onready var Player = $Player
onready var HUD = $UI/HUD
onready var ButtonLaunch = $UI/Button_Launch

const levelMaker_scene = preload("res://entities/LevelMaker.tscn")

var _serve = true
var _level

func _ready() -> void:
	Ball.position.x = Player.position.x
	ButtonLaunch.hide()
	load_level()

func _physics_process(_delta: float) -> void:
	if _serve:
		serve()

func _input(_event: InputEvent) -> void:
		if Input.is_action_just_pressed("ui_cancel"):
			change_scene("Titlescreen")

func serve() -> void:
	Ball.position.x = Player.position.x
	Ball.position.y = Player.position.y - 10
	ButtonLaunch.show()
	ButtonLaunch.grab_focus()

func load_level() -> void:
	var levelMaker = levelMaker_scene.instance()
	add_child(levelMaker)
	levelMaker.position.y = 50
	if (levelMaker.get_child_count() <= max(20, (level-1)*50)  or
		levelMaker.get_child_count() >= level*50) :
		levelMaker.free()
		load_level()
	else:
		_level = get_node("LevelMaker")

func _on_Ball_hit_wall() -> void:
	play_sound("wall_hit")

func _on_Ball_hit_player() -> void:
	play_sound("paddle_hit")

func _on_Ball_hit_brick() -> void:
	play_sound("brick_hit_2")
	var bricks_total = _level.get_child_count()
	if bricks_total <= 1:
		change_scene("Win")

func _on_Fallzone_body_entered(body):
	if body == Ball:
		_serve = true
		play_sound("hurt")
		HUD.health -= 1
		if HUD.health <= 0:
			level_parameters.score = HUD.score
			change_scene("Gameover")

func _on_Button_Launch_pressed() -> void:
	_serve = false
	Ball.serve()
	ButtonLaunch.hide()
