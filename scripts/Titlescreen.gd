extends BaseScene

onready var MainMenu = $Menu_Main
onready var LevelMenu = $Menu_Level
onready var button = {
	start = $Menu_Main/Button_Start,
	highscore = $Menu_Main/Button_Highscore,
	easy = $Menu_Level/Button_Easy,
	medium = $Menu_Level/Button_Medium,
	hard = $Menu_Level/Button_Hard,
	insane = $Menu_Level/Button_Insane
}

func start() -> void:
	button.start.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()



# Button Press Function
func _on_Button_Start_pressed() -> void:
	MainMenu.hide()
	LevelMenu.show()
	button.easy.grab_focus()
	play_sound("confirm")
func _on_Button_Highscore_pressed() -> void:
	play_sound("confirm")
func _on_Button_Level_pressed(level: int) -> void:
	level_parameters.level = level
	change_scene("Play")

# Button Mouse over Function
func _on_Button_mouse_entered(index: String) -> void:
	play_sound("paddle_hit")
	button[index].grab_focus()

# Button Focus Function
func _on_Button_focus_entered() -> void:
	play_sound("paddle_hit")
