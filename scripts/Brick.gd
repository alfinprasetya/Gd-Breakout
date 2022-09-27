extends StaticBody2D

onready var HUD = get_parent().get_parent().get_node("UI/HUD")

func _ready() -> void:
	set_meta("brick", true)

func hit():
	HUD.score += 10
	queue_free()
