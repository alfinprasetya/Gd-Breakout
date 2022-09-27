extends Node

onready var current_scene = $TitlescreenScene
onready var gSounds = {
	paddle_hit = $SoundManager/paddle_hit,
	confirm = $SoundManager/confirm,
	wall_hit = $SoundManager/wall_hit,
	hurt = $SoundManager/hurt,
	brick_hit_2 = $SoundManager/brick_hit_2
}

func _ready() -> void:
	randomize()
	current_scene.connect("scene_changed", self, "change")
	current_scene.connect("play_sound", self, "play_sound")

func change(scene):
	var next_scene = load("res://scene/" + scene + "Scene.tscn").instance()
	add_child(next_scene)
	
	next_scene.connect("scene_changed", self, "change")
	next_scene.connect("play_sound", self, "play_sound")
	next_scene.load_level_parameters(current_scene.level_parameters)
	
	current_scene.queue_free()
	current_scene = next_scene
	$Timer.start()

func play_sound(sound):
	gSounds[sound].play()

func _on_Timer_timeout():
	current_scene.start()
