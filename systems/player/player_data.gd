class_name PlayerData
extends RefCounted

var workers_per_round := 2
var workers := workers_per_round

@export var resources: Dictionary[Enum.ResourceType, int] = {
	Enum.ResourceType.Money: 5
}

func new_round() -> void:
	workers = workers_per_round
	GameData.player_data_worker_changed.emit(self)

func use_worker() -> void:
	if workers == 0:
		Logger.warn("trying to use worker while at 0", "player_data.gd")
		return
	workers -= 1
	GameData.player_data_worker_changed.emit(self)

func get_available_resources() -> Array[Enum.ResourceType]:
	return resources.keys()

func get_resource(type: Enum.ResourceType) -> int:
	_init_if_null(type)
	return resources[type]

func add_resource(type: Enum.ResourceType, amount: int) -> void:
	_init_if_null(type)
	resources[type] += amount
	GameData.player_data_resource_changed.emit(self, type)

func remove_resource(type: Enum.ResourceType, amount: int) -> void:
	add_resource(type, -amount)
	GameData.player_data_resource_changed.emit(self, type)

func _init_if_null(type: Enum.ResourceType) -> void:
	if not resources.has(type):
		resources[type] = 0
