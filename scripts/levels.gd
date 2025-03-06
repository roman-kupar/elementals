extends Control

@onready var grid_container: GridContainer = $GridContainer


func _ready():
	var last_unlocked_level = SaveSystem.last_level
	
	# Get all buttons in GridContainer
	for button in grid_container.get_children():
		if button is Button:
			var level_num = int(button.name.trim_prefix("LevelButton"))  # Extract level number
			
			# Enable only if level is unlocked
			if level_num <= last_unlocked_level:
				button.disabled = false  # Unlock
			else:
				button.disabled = true   # Lock


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn") 

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn") 

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	
func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")
	
func _on_level_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_6.tscn")
	
func _on_level_7_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")

func _on_level_8_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_8.tscn")

func _on_level_9_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_9.tscn")

func _on_level_10_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_10.tscn")
