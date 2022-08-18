extends Node

onready var current_scene = $TitlescreenScene
onready var gSounds = {
	paddle_hit = $SoundManager/paddle_hit,
	confirm = $SoundManager/confirm,
	wall_hit = $SoundManager/wall_hit
}

func _ready() -> void:
	current_scene.connect("scene_changed", self, "change")
	current_scene.connect("play_sound", self, "play_sound")

func change(scene):
	var next_scene = load("res://scene/" + scene + "Scene.tscn").instance()
	add_child(next_scene)
	
	next_scene.connect("scene_changed", self, "change")
	next_scene.connect("play_sound", self, "play_sound")
	
	current_scene.queue_free()
	current_scene = next_scene

func play_sound(sound):
	gSounds[sound].play()