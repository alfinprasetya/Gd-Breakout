extends StaticBody2D

func _ready() -> void:
	set_meta("brick", true)

func hit():
	get_parent().get_parent().get_node("UI/HUD").score += 10
	queue_free()
