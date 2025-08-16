class_name ResourceData
extends Resource

@export var type: Enum.ResourceType
@export var label: String
@export var sprite: Texture2D

static func from(_type: Enum.ResourceType) -> ResourceData:
	return Data.resources[_type]
