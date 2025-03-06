class_name StateBar
extends HBoxContainer

@export var order: Array[Player.Element]
@export var ground: CompressedTexture2D
@export var water: CompressedTexture2D
@export var air: CompressedTexture2D
@export var none: CompressedTexture2D

var current: int = 0
var elements: Array[TextureRect]

func _ready():
	set_texture_filter(CanvasItem.TEXTURE_FILTER_NEAREST)

	for element in order:
		var texture = match_texture(element)
		var rect = TextureRect.new()
		rect.texture = texture
		rect.custom_minimum_size = Vector2(100, 100)  

		rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT  
		rect.size_flags_horizontal = Control.SIZE_EXPAND
		rect.size_flags_vertical = Control.SIZE_EXPAND
		
		add_child(rect)
		elements.append(rect)

func match_texture(element: Player.Element) -> CompressedTexture2D:
	match element:
		Player.Element.GROUND:
			return ground
		Player.Element.WATER:
			return water
		Player.Element.AIR:
			return air
	return none

func validate(next: Player.Element) -> bool:
	if current >= order.size():
		return false

	if order[current] == Player.Element.NONE:
		fade_element(current)
		current += 1
		return true
	if next == order[current]:
		fade_element(current)
		current += 1
		return true
	return false

func fade_element(i: int):
	elements[i].modulate = Color.GRAY
