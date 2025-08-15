class_name HexCell
extends Node2D

const MY_SCENE = preload("res://systems/hexagon/hex_cell/hex_cell.tscn")

@onready var dnd: DragAndDrop = %DragAndDrop

var coordinate := Vector2i.MIN # Use Vector2i.MIN as a invalid value

var _original_z := z_index
var _original_modulate := modulate

static func create_instance(parent: Node) -> HexCell:
	var instance: HexCell = MY_SCENE.instantiate()
	parent.add_child(instance)
	return instance

func _ready() -> void:
	dnd.drag_started.connect(_on_hex_drag_start)
	dnd.drag_dropped.connect(_on_hex_drag_end)
	dnd.drag_canceled.connect(_on_hex_drag_end)

func _on_hex_drag_start(_drag_data: DragData) -> void:
	z_index = 100
	modulate = Color(_original_modulate, 0.9)

func _on_hex_drag_end(_drag_data: DragData) -> void:
	z_index = _original_z
	modulate = _original_modulate
