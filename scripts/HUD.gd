extends Control

onready var label_fps = $Label_FPS

func _ready():
	pass

func _physics_process(delta):
	var fps = Engine.get_frames_per_second()
	label_fps.text = "FPS: " + str(fps)
