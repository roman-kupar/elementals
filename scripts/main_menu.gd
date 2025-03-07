extends Control

@onready var levels_menu: Control = $LevelsMenu
@onready var main_menu: VBoxContainer = $VBoxContainer
@onready var title: Label = $Label
@onready var back: Button = $Back
@export var selectedLevel : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Last unlocked level: ", SaveSystem.last_level)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/game.tscn")
		
func _on_levels_pressed() -> void:
	main_menu.hide()
	title.hide()
	levels_menu.show()
	back.show()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	main_menu.show()
	title.show()
	levels_menu.hide()
	back.hide()
