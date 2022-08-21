extends BaseScene

var highlighted = 1

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		highlighted = 2 if highlighted == 1 else 1
		play_sound("paddle_hit")
	
	if Input.is_action_just_pressed("ui_accept"):
		match highlighted:
			1:
				change_scene("Play")
		
		play_sound("confirm")
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	match highlighted:
		1:
			$Label_Start.add_color_override("font_color", '#00ffff')
			$Label_Highscore.add_color_override("font_color", '#ffffff')
		2:
			$Label_Start.add_color_override("font_color", '#ffffff')
			$Label_Highscore.add_color_override("font_color", '#00ffff')
