extends Node

@onready var level_container = $Level

var current_level = SaveSystem.last_level  # Track the current level
const MAX_LEVEL = 10    

func _ready():
	load_level(current_level)

func load_level(level_num: int):
	# Remove the previous level (if any)
	if level_container.get_child_count() > 0:
		level_container.get_child(0).queue_free()

	# Load the new level
	var level_path = "res://scenes/levels/level_" + str(level_num) + ".tscn"
	var new_level = load(level_path).instantiate()
	level_container.add_child(new_level)

func next_level():
	if current_level < MAX_LEVEL:
		current_level += 1
		load_level(current_level)

func restart_level():
	load_level(current_level)
