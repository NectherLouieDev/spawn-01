class_name ScoreValue
extends Label

#@export var player_data: PlayerData
@export var game_data: GameData

func _process(delta):
	text = str(game_data.score).pad_zeros(8)
