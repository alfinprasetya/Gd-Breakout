extends BaseScene

onready var ButtonStart = $Button_Start
onready var ButtonHigh = $Button_Highscore

func start() -> void:
	ButtonStart.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_Button_Start_pressed() -> void:
	play_sound("confirm")
	change_scene("Play")

func _on_Button_Highscore_pressed() -> void:
	play_sound("confirm")

func _on_Button_Start_mouse_entered() -> void:
	play_sound("paddle_hit")
	ButtonStart.grab_focus()

func _on_Button_Highscore_mouse_entered() -> void:
	play_sound("paddle_hit")
	ButtonHigh.grab_focus()

func _on_Button_Start_focus_entered() -> void:
	play_sound("paddle_hit")

func _on_Button_Highscore_focus_entered() -> void:
	play_sound("paddle_hit")
