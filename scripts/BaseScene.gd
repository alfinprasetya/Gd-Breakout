class_name BaseScene
extends Node

signal scene_changed(sceneName)
signal play_sound(soundName)

var level_parameters = {
	score = 0
}

func start():
	pass

func change_scene(nextScene):
	emit_signal("scene_changed", nextScene)

func play_sound(soundName):
	emit_signal("play_sound", soundName)

func load_level_parameters(new_level_parameters):
	level_parameters = new_level_parameters
