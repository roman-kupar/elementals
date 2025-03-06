class_name StateBar
extends HBoxContainer

@export var order: Array[Player.Element]

var current: int = 0

func validate(next: Player.Element) -> bool:
	if current >= order.size():
		return false

	if order[current] == Player.Element.NONE:
		current += 1
		return true
	if next == order[current]:
		current += 1
		return true
	return false
