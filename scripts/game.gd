extends Node

@onready var level_container = $Level # A placeholder node to hold levels

var current_level: int

func _ready():
	load_level(SaveSystem.to_load)

func load_level(level_num: int):
	current_level = level_num
	
	if (level_num > 8):
		get_tree().change_scene_to_file("res://scenes/main/game.tscn")
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
	load_level(SaveSystem.last_level)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")

func _on_restart_pressed():
	load_level(current_level)
