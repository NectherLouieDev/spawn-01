extends Node

var score: int = 0

func add_score(value: int) -> void:
	score += value

func reset_score():
	score = 0
