class_name GameData
extends Resource

@export var score: int = 0
@export var hiscore: int = 0

func add_score(value:int) -> void:
	score += value
	
	if score >= hiscore:
		hiscore = score
		
	print(score, ":", hiscore)

func reset_score():
	score = 0
