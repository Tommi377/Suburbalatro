class_name CompoundAction
extends Action

@export var actions: Array[Action]

static func get_id() -> String:
	return "compound_action"
	
func execute(player: PlayerData, grid: HexGrid) -> void:
	for action in actions:
		action.execute(player, grid)

func get_description() -> String:
	var descriptions := actions.map(
		func(action: Action) -> String: return action.get_description()
	)
	return '\n'.join(descriptions)
