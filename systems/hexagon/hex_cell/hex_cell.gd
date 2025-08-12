class_name HexCell
extends Node2D

@onready var drag_and_drop: DragAndDrop = %DragAndDrop

func _ready() -> void:
	drag_and_drop.drag_started.connect(
		func(dragData: DragData) -> void:
			Logger.debug("Start", "drag", dragData)
	)
	drag_and_drop.drag_canceled.connect(
		func(dragData: DragData) -> void:
			Logger.debug("Cancel", "drag", dragData)
	)
	drag_and_drop.drag_dropped.connect(
		func(dragData: DragData) -> void:
			Logger.debug("Drop", "drag", dragData)
	)
