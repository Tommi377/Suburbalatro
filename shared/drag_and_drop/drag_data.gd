class_name DragData
extends RefCounted

var node: Node
var starting_position: Vector2
var offset: Vector2

func _init(_node: Node2D, _offset: Vector2) -> void:
	node = _node
	starting_position = _node.global_position
	offset = _offset
