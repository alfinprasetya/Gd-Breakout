extends BaseScene

onready var ButtonStart = $Button_Start

func start():
	ButtonStart.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_Button_Start_pressed() -> void:
	change_scene("Play")
	play_sound("confirm")

func _on_Button_Start_mouse_entered() -> void:
	play_sound("paddle_hit")

func load_level_parameters(new_level_parameters):
	level_parameters = new_level_parameters
	$Label_Score.text = "Score : " + str(level_parameters.score)
