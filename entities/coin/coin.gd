class_name Coin
extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# add a score
	GameManager.add_score(10)
	# display the score sa UI
	queue_free()
