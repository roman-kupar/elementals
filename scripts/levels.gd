extends Control

@onready var grid_container: GridContainer = $GridContainer

func _ready():
	var last_unlocked_level = SaveSystem.last_level  

	# Get all buttons in GridContainer
	for button in grid_container.get_children():
		if button is Button:
			var level_num = int(button.name.trim_prefix("LevelButton"))  # Extract level number
			
			# Enable only if level is unlocked
			button.disabled = level_num > last_unlocked_level

			# Connect button press event dynamically
			button.pressed.connect(_on_level_button_pressed.bind(level_num))

func _on_level_button_pressed(level_num: int) -> void:
	var level_path = "res://scenes/levels/level_" + str(level_num) + ".tscn"
	get_tree().change_scene_to_file(level_path)
