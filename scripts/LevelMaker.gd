extends Node2D

const brick_scene = preload("res://entities/Brick.tscn")

var brick_size = 17 * 0.7

func _ready() -> void:
	level_maker()

func level_maker() -> void:
	randomize()
	
	var Rows = randi() % 18 + 2
	var Cols = randi() % 9 + 5
	Cols = Cols + 1 if Cols % 2 == 0 else Cols
	
	var Gap = false
	var gapStart = 1
	
	if Cols >= 9:
		Gap = true if randi() % 2 == 0 else false
		if Gap:
			gapStart = randi() % ((Cols-3)/2) + 1
	
	var alternateColor1 = randi() % 10 + 12
	var alternateColor2 = randi() % 10 + 12
	var solidColor = randi() % 10 + 12
	
	for row in range(Rows):
		
		var skipPattern = true if randi() % 2 == 0 else false
		var skipFlag = true if randi() % 2 == 0 else false
		
		var alternatePattern = true if randi() % 2 == 0 else false
		var alternateFlag = true if randi() % 2 == 0 else false
		
		for col in range(Cols):
			if Gap:
				if (col == gapStart or 
					col == gapStart + 1 or
					col == Cols - 1 - gapStart or
					col == Cols - 1 - gapStart - 1):
					skipFlag = not skipFlag
					alternateFlag = not alternateFlag
					continue
			
			if skipPattern and skipFlag:
				skipFlag = not skipFlag
				alternateFlag = not alternateFlag
				continue
			else:
				skipFlag = not skipFlag
			
			if alternatePattern and alternateFlag:
				spawn_brick(Cols, row, col, alternateColor1)
				alternateFlag = not alternateFlag
			elif alternatePattern and not alternateFlag:
				spawn_brick(Cols, row, col, alternateColor2)
				alternateFlag = not alternateFlag
			else:
				spawn_brick(Cols, row, col, solidColor)

func spawn_brick(Total_Column, row, col, color) -> void:
	var brick = brick_scene.instance()
	add_child(brick)
	brick.position.x = brick_size * ((15 - Total_Column)/2 + col)
	brick.position.y = row * brick_size
	brick.get_node("Sprite").frame_coords.y = color
