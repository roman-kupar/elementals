extends Control

@onready var grid_container: GridContainer = $GridContainer
@onready var main_menu: Control = $".."

func _ready():
	var last_unlocked_level = SaveSystem.last_level

	# Get all buttons in GridContainer
	for button in grid_container.get_children():
		if button is Button:
			var level_num = int(button.name.trim_prefix("LevelButton")) # Extract level number

			# Enable only if level is unlocked
			button.disabled = level_num > last_unlocked_level

			button.pressed.connect(func(): _on_level_button_pressed(level_num))

# Called when a level button is pressed
func _on_level_button_pressed(level_num: int) -> void:
	SaveSystem.to_load = level_num
	get_tree().change_scene_to_file("res://scenes/main/game.tscn")
