class_name ResourceData
extends Resource

@export var type: Enum.ResourceType
@export var label: String
@export var sprite: Texture2D

static var _resource_path := "res://content/resource_data/%s.tres"

static func from(_type: Enum.ResourceType) -> ResourceData:
	@warning_ignore("unsafe_cast")
	var type_name := Enum.ResourceType.find_key(_type) as String
	var final_resource_path := _resource_path % type_name.to_snake_case()
	return load(final_resource_path)
