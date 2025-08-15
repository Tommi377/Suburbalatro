#class_name RunData
extends Node

signal player_data_resource_changed

var playerData: PlayerData = PlayerData.new()

func start_new_run() -> void:
	playerData = PlayerData.new()
