extends BaseScene

onready var ButtonStart = $Button_Start

func _ready() -> void:
	ButtonStart.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_Button_Start_pressed() -> void:
	change_scene("Titlescreen")
	play_sound("confirm")

func _on_Button_Start_mouse_entered() -> void:
	play_sound("paddle_hit")
