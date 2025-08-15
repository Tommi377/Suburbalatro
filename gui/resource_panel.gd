class_name ResourcePanel
extends PanelContainer

const MY_SCENE = preload("res://gui/resource_panel.tscn")

@export var resourceType: Enum.ResourceType
var _resourceData: ResourceData

@onready var count: Label = %Count
@onready var icon: TextureRect = %Icon

static func create_instance(parent: Node, type: Enum.ResourceType) -> ResourcePanel:
	var instance := MY_SCENE.instantiate() as ResourcePanel
	instance.resourceType = type
	parent.add_child(instance)
	return instance

func _ready() -> void:
	_resourceData = ResourceData.from(resourceType)
	update_ui()

func update_ui() -> void:
	var data := GameData.playerData.get_resource(_resourceData.type)
	count.text = str(data)
	icon.texture = _resourceData.sprite
