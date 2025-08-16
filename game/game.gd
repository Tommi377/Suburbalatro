class_name Game
extends Node

@onready var hex_grid: HexGrid = %HexGrid
@onready var action_ui: ActionUI = %ActionUI

var SAWMILL = load("res://content/building/sawmill/sawmill.tres")

var basic_actions: Array[String] = [
	'forest', 'mountain', 'clay_pit'
]

func _ready() -> void:
	var hex := HexCell.create_instance(self, SAWMILL)
	hex.global_position = Vector2(300, 0)
	_register_hex_cell(hex)
	
	for action in basic_actions:
		var building := BuildingData.from(action)
		var btn := action_ui.add_action(building)
		btn.button.pressed.connect(_on_action_button_pressed.bind(building))
	
	GameData.start_new_run()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		tick()

func tick() -> void:
	for building: HexCell in hex_grid.get_all_buildings():
		for action in building.building_data.actions:
			if action.can_execute(Enum.Trigger.OnTick, GameData.playerData, hex_grid):
				action.execute(GameData.playerData, hex_grid)
	
	GameData.end_round()

func use_action(building: BuildingData) -> void:
		for action in building.actions:
			if action.can_execute(Enum.Trigger.OnUse, GameData.playerData, hex_grid):
				action.execute(GameData.playerData, hex_grid)
				GameData.playerData.use_worker()

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

func _on_action_button_pressed(building: BuildingData) -> void:
	use_action(building)
