extends CanvasLayer

@onready var elemental_sequence: HBoxContainer = $HBoxContainer

func update_box_order(sequence: Array):
	for child in elemental_sequence.get_children():
		child.queue_free()

	for box_name in sequence:
		var box_label = Label.new()
		box_label.text = box_name
		box_label.add_theme_color_override("font_color", Color.WHITE)
		box_label.add_theme_font_size_override("font_size", 24)
		elemental_sequence.add_child(box_label)
