class_name BuildingData
extends Resource

@export_category("Data")
@export var id: String
@export var name: String
@export var sprite: Texture2D
@export var is_action: bool = false

@export_category("Gameplay")
@export var rarity: Enum.Rarity = Enum.Rarity.Common
@export var baseCost: Dictionary[Enum.ResourceType, int]
@export var actions: Array[Action]

static func from(_id: String) -> BuildingData:
	if Data.buildings.has(_id):
		return Data.buildings[_id]
	else:
		Logger.error("tried to get building from unknown id", "_building_data.gd", _id)
		return null

func get_action_description() -> String:
	var descriptions := actions.map(
		func(action: Action) -> String: return action.get_description()
	)
	return '\n'.join(descriptions)
