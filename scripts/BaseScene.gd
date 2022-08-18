class_name BaseScene
extends Node

signal scene_changed(sceneName)
signal play_sound(soundName)

func change_scene(nextScene):
	emit_signal("scene_changed", nextScene)

func play_sound(soundName):
	emit_signal("play_sound", soundName)
