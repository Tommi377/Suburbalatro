class_name RoundUI
extends MarginContainer

@onready var round_number: Label = $RoundNumber

func _ready() -> void:
	GameData.round_end.connect(_on_round_end)
	_on_round_end()

func _on_round_end() -> void:
	round_number.text = "Round %d" % GameData.round
