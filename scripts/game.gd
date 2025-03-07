extends Node

@onready var level_container = $Level # A placeholder node to hold levels

func _ready():
	load_level(SaveSystem.to_load)

func load_level(level_num: int):
	# Free previous level (if any)
	for child in level_container.get_children():
		child.queue_free()

	# Load the new level
	var level_path = "res://scenes/levels/level_" + str(level_num) + ".tscn"
	var level_scene = load(level_path).instantiate()
	
	var player: Player = level_scene.get_node("Player")
	player.finished.connect(level_finished)
	
	level_container.add_child(level_scene)

func level_finished():
	SaveSystem.set_progress("level", SaveSystem.last_level + 1)
	var last_level = SaveSystem.last_level
	load_level(last_level)
