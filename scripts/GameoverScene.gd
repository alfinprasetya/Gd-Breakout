extends BaseScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		change_scene("Titlescreen")
		play_sound("confirm")
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
