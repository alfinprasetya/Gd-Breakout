extends BaseScene

export (int, 1, 4) var level = 1

onready var Ball = $Ball
onready var Player = $Player
onready var HUD = $UI/HUD
onready var ButtonLaunch = $UI/Button_Launch

const levelMaker_scene = preload("res://entities/LevelMaker.tscn")

var _serve = false
var _level

func start() -> void:
	Ball.show()
	Ball.position.x = Player.position.x
	load_level()
	_serve = true

func _physics_process(_delta: float) -> void:
	level_parameters.score = HUD.score
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
			change_scene("Gameover")

func _on_Button_Launch_pressed() -> void:
	_serve = false
	Ball.serve()
	ButtonLaunch.hide()

func load_level_parameters(new_level_parameters):
	level_parameters = new_level_parameters
	HUD.score = level_parameters.score
	level = level_parameters.level
