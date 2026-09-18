class_name ScoreValue
extends Label

@export var player_data: PlayerData

func _process(delta):
	text = str(player_data.score).pad_zeros(8)
