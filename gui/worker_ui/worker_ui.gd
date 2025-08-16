class_name WorkerUI
extends Control

const WORKER_PANEL = preload("res://gui/worker_ui/worker_panel.tscn")

func _ready() -> void:
	GameData.player_data_worker_changed.connect(_update_ui)
	_update_ui(GameData.playerData)

func _update_ui(player: PlayerData) -> void:
	if not player:
		return
	
	var diff := player.workers - get_children().size()
	for i in range(abs(diff)):
		if diff > 0:
			var worker_panel = WORKER_PANEL.instantiate()
			self.add_child(worker_panel)
		else:
			self.get_child(i).queue_free()
