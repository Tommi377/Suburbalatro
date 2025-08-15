class_name Action
extends Resource

@export var triggers: Array[Enum.Trigger]
@export var requirements: Array[Requirement]

static func get_id() -> String:
	Logger.error("calling get_id() on abstract Action Resource", "Action.gd")
	return ""

func execute(_player: PlayerData, _grid: HexGrid) -> void:
	Logger.error("calling apply() on abstract Action Resource", "Action.gd")

func can_execute(trigger: Enum.Trigger, player: PlayerData, grid: HexGrid) -> bool:
	if not triggers.has(trigger):
		return false
	
	return requirements.all(
		func(requirement): requirement.apply(player, grid)
	)
