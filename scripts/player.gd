extends AnimatedSprite2D

signal move_requested
signal finished

@export var tilemap: TileMap
@export var start_pos: Vector2i
@export var finish_pos: Vector2i

var tilemap_pos: Vector2i:
	set(value):
		var current = get_current_element()
		var next = get_element(value)
		if validate_move(current, next):
			tilemap_pos = value
			move_requested.emit()

func _ready():
	play("default")
	tilemap_pos = start_pos
	position = tilemap.map_to_local(tilemap_pos)
	move_requested.connect(move)
	finished.connect(func(): print("finish"))

func _process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		tilemap_pos += Vector2i.UP
	if Input.is_action_just_pressed("ui_right"):
		tilemap_pos += Vector2i.RIGHT
	if Input.is_action_just_pressed("ui_down"):
		tilemap_pos += Vector2i.DOWN
	if Input.is_action_just_pressed("ui_left"):
		tilemap_pos += Vector2i.LEFT

func move():
	position = tilemap.map_to_local(tilemap_pos)
	if tilemap_pos == finish_pos:
		finished.emit()

func validate_move(current: Element, next: Element) -> bool:
	if next == Element.NONE: return false

	if current == next:
		return true
	if current == Element.GROUND:
		return true
	if current == Element.WATER and next == Element.AIR:
		return true
	if current == Element.AIR and next == Element.GROUND:
		return true
	return false

func get_current_element() -> Element:
	var co = tilemap.local_to_map(position)
	return get_element(co)

func get_element(pos: Vector2i) -> Element:
	var ground = tilemap.get_cell_tile_data(Element.GROUND, pos)
	var water = tilemap.get_cell_tile_data(Element.WATER, pos)
	var air = tilemap.get_cell_tile_data(Element.AIR, pos)

	if ground != null: return Element.GROUND
	if water != null: return Element.WATER
	if air != null: return Element.AIR
	return Element.NONE

enum Element {
	GROUND = 0,
	WATER = 1,
	AIR = 2,
	NONE = 255
}
