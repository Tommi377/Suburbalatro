class_name ResourceChangeAction
extends Action

@export var resourceType: Enum.ResourceType
@export var amount: int

static func get_id() -> String:
	return "resource_change_action"
	
func execute(player: PlayerData, grid: HexGrid) -> void:
	player.add_resource(resourceType, amount)

func get_description() -> String:
	var resourceData := ResourceData.from(resourceType)
	if amount < 0:
		return "Lose %d %s" % [-amount, resourceData.label]
	else:
		return "Gain %d %s" % [amount, resourceData.label]
