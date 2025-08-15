class_name Game
extends Node

@onready var hex_grid: HexGrid = %HexGrid
const SAWMILL = preload("res://content/building/sawmill/sawmill.tres")
func _ready() -> void:
	var hex := HexCell.create_instance(self, SAWMILL)
	hex.global_position = Vector2(300, 0)
	_register_hex_cell(hex)
	
	GameData.start_new_run()

func tick() -> void:
	for building: HexCell in hex_grid.get_all_buildings():
		for action in building.building_data.actions:
			if action.can_execute(Enum.Trigger.OnTick, GameData.playerData, hex_grid):
				action.execute(GameData.playerData, hex_grid)
	pass

func _register_hex_cell(hex: HexCell) -> void:
	hex.dnd.drag_started.connect(_on_hex_drag_started)
	hex.dnd.drag_dropped.connect(_on_hex_drag_dropped)
	hex.dnd.drag_canceled.connect(_on_hex_drag_canceled)

func _on_hex_drag_started(drag_data: DragData) -> void:
	if drag_data.node is HexCell:
		var hex: HexCell = drag_data.node
		hex_grid.remove(hex)
	else:
		drag_data.reset_node_position()

func _on_hex_drag_dropped(drag_data: DragData) -> void:
	if drag_data.node is HexCell:
		var hex: HexCell = drag_data.node
		var success := hex_grid.try_place(hex, hex.global_position - drag_data.offset)
		if not success:
			drag_data.reset_node_position()
	

func _on_hex_drag_canceled(drag_data: DragData) -> void:
	drag_data.reset_node_position()
