extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Last unlocked level: ", SaveSystem.last_level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	#TODO
	#Change that, to load the level, based on last unlocked level
	

func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/levels.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
