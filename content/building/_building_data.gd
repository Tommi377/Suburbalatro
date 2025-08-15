class_name BuildingData
extends Resource

@export_category("Data")
@export var name: String
@export var sprite: Texture2D

@export_category("Gameplay")
@export var baseCost: Dictionary[Enum.ResourceType, int]
@export var actions: Array[Action]
