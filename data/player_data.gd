class_name PlayerData
extends Resource

signal score_updated(new_score: int)

@export var score: int = 0

func add_score(value: int) -> void:
	score += value
	score_updated.emit(score)

func reset_score() -> void:
	score = 0
	score_updated.emit(score)
