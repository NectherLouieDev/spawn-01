class_name Coin
extends Area2D

@export var player_data: PlayerData = preload("res://data/player_data.tres")

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# add a score if the body is player only
	if body is PlayerPlatformer:
		player_data.add_score(10)
		queue_free()
