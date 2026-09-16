extends Node

@export var player_data: PlayerData = preload("res://data/player_data.tres")

func _ready():
	print("Manager Game States and Behaviour instead of data")
	player_data.score_updated.connect(on_score_updated)

func on_score_updated(new_score: int) -> void:
	print("new score: ", new_score)
	if new_score == 40:
		print("Victory! Change State to Victory Scene")
