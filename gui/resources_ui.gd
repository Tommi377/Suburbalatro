class_name ResourcesUI
extends VBoxContainer

var resourcePanels: Dictionary[Enum.ResourceType, ResourcePanel] = {}

func _ready() -> void:
	GameData.player_data_resource_changed.connect(_on_player_data_resource_changed)
	_update_ui()

func _update_ui() -> void:
	for type in GameData.playerData.get_available_resources():
		if not resourcePanels.has(type):
			var panel := ResourcePanel.create_instance(self, type)
			resourcePanels[type] = panel
		else:
			resourcePanels[type].update_ui()


func _on_player_data_resource_changed(_player: PlayerData, _type: Enum.ResourceType) -> void:
	_update_ui()
