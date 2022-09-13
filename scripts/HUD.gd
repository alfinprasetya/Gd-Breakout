extends Control

onready var ui_fps = $Label_FPS
onready var ui_score = $Score/Label_ScoreNumber
onready var ui_health = $Health.get_children()

var fps = 0
var score :int = 0 setget draw_score
var health :int = 3 setget draw_health

func _ready() -> void:
	draw_score(score)
	draw_health(health)

func _physics_process(_delta: float) -> void:
	fps = Engine.get_frames_per_second()
	ui_fps.text = "FPS: " + str(fps)

func draw_score(new_score) -> void:
	score = new_score
	ui_score.text = str(score)

func draw_health(new_health) -> void:
	health = new_health
	
	for i in health:
		ui_health[i].frame = 0
	for i in range(3, health, -1):
		ui_health[i-1].frame = 1
