extends StaticBody2D

func _ready() -> void:
	set_meta("brick", true)

func hit():
	queue_free()
