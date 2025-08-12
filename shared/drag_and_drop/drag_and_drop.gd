class_name DragAndDrop
extends Node

signal drag_started(drag_data: DragData)
signal drag_canceled(drag_data: DragData)
signal drag_dropped(drag_data: DragData)

@export var enabled: bool = true
@export var target: Area2D

@export var start_drag_action := "mouse1"
@export var cancel_drag_action := "mouse2"

var dragging := false
var dragData: DragData

func _ready() -> void:
	assert(target, "DragAndDrop: No target set")
	target.input_event.connect(_on_target_input_event.unbind(1))

func _input(event: InputEvent) -> void:
	if dragging and event.is_action_pressed(cancel_drag_action):
		_cancel_dragging()
	elif dragging and event.is_action_released(start_drag_action):
		_drop()

func _process(_delta: float) -> void:
	if dragging and target:
		target.global_position = target.get_global_mouse_position() + dragData.offset

func _end_dragging() -> void:
	dragging = false
	target.remove_from_group("dragging")
	
func _cancel_dragging() -> void:
	_end_dragging()
	drag_canceled.emit(dragData)

func _start_dragging() -> void:
	dragging = true
	target.add_to_group("dragging")
	target.z_index = 99
	var offset := target.global_position - target.get_global_mouse_position()
	dragData = DragData.new(target, offset)
	drag_started.emit(dragData)

func _drop() -> void:
	_end_dragging()
	drag_dropped.emit(dragData)
	
func _on_target_input_event(_viewport: Node, event: InputEvent) -> void:
	if not enabled:
		return

	var dragging_object := get_tree().get_first_node_in_group("dragging")
	
	if not dragging and dragging_object:
		return
		
	if not dragging and event.is_action_pressed(start_drag_action):
		_start_dragging()
