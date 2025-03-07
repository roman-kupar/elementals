extends Node

const SAVE_PATH = "user://savegame.dat"
var progress: Dictionary = {}
var last_level: int = 1  # Default value

func _ready():
	restart_progress()
	load_game()
	last_level = get_progress("level", 1)  # Load last level at startup

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(progress)
		file.close()

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		progress = {}  # Default empty progress
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	progress = file.get_var()
	file.close()

func set_progress(key: String, value):
	progress[key] = value
	save_game()
	if key == "level":
		last_level = value  # Update global last_level

func get_progress(key: String, default = null):
	return progress.get(key, default)

func restart_progress():
	progress.clear()
	last_level = 1  
	save_game()
