class_name ActionButton
extends PanelContainer

const MY_SCENE = preload("res://gui/action_ui/action_button.tscn")

@export var buildingData: BuildingData

@onready var button: Button = %Button
@onready var _icon: TextureRect = %Icon
@onready var _label: Label = %Label
@onready var _description: Label = %Description

static func create_instance(parent: Node, building: BuildingData) -> ActionButton:
	var instance := MY_SCENE.instantiate() as ActionButton
	instance.buildingData = building
	parent.add_child(instance)
	return instance

func _ready() -> void:
	_icon.texture = buildingData.sprite
	_label.text = buildingData.name
	_description.text = buildingData.get_action_description()

	GameData.player_data_worker_changed.connect(_on_player_data_worker_changed)

func _on_player_data_worker_changed(player: PlayerData) -> void:
	# TODO: Check for action execute eligibility
	button.disabled = player.workers <= 0
