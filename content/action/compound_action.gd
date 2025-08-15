class_name CompoundAction
extends Action

@export var actions: Array[Action]

static func get_id() -> String:
	return "compound_action"
	
func execute(player: PlayerData, grid: HexGrid) -> void:
	for action in actions:
		action.execute(player, grid)
