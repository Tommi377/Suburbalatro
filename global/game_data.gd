#class_name GameData
extends Node

signal round_end
signal player_data_worker_changed(player: PlayerData)
signal player_data_resource_changed(player: PlayerData, type: Enum.ResourceType)

var playerData: PlayerData = PlayerData.new()

func start_new_run() -> void:
	playerData = PlayerData.new()

func end_round() -> void:
	playerData.new_round()
	round_end.emit()
