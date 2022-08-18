extends BaseScene

var paused = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		change_scene("Titlescreen")

func _on_Ball_hit_wall() -> void:
	play_sound("wall_hit")

func _on_Ball_hit_player() -> void:
	play_sound("paddle_hit")
