class_name PlayerData
extends RefCounted

@export var resources: Dictionary[Enum.ResourceType, int] = {}

func _init() -> void:
	resources[Enum.ResourceType.Worker] = 2
	resources[Enum.ResourceType.Money] = 5

func get_available_resources() -> Array[Enum.ResourceType]:
	return resources.keys()

func get_resource(type: Enum.ResourceType) -> int:
	_init_if_null(type)
	return resources[type]

func add_resource(type: Enum.ResourceType, amount: int) -> void:
	_init_if_null(type)
	resources[type] += amount
	RunData.player_data_resource_changed.emit()

func remove_resource(type: Enum.ResourceType, amount: int) -> void:
	add_resource(type, -amount)
	RunData.player_data_resource_changed.emit()

func _init_if_null(type: Enum.ResourceType) -> void:
	if not resources.has(type):
		resources[type] = 0
