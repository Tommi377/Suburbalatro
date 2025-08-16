class_name ActionUI
extends Control

@onready var action_grid: VBoxContainer = $ActionGrid

func add_action(action_building: BuildingData) -> ActionButton:
	return ActionButton.create_instance(action_grid, action_building)
