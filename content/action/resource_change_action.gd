class_name ResourceChangeAction
extends Action

@export var resourceType: Enum.ResourceType
@export var amount: int

static func get_id() -> String:
	return "resource_change_action"
	
func execute(player: PlayerData, grid: HexGrid) -> void:
	player.add_resource(resourceType, amount)
