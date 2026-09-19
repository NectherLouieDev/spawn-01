class_name Coin
extends Area2D

#@export var player_data: PlayerData = preload("res://data/player_data.tres")
@export var game_data: GameData = preload("res://day2/res_game_data.tres")
@export var coin_value: int = 10

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# add a score if the body is player only
	if body is PlayerPlatformer or body is PlayerTopDown:
		#player_data.add_score(10)
		game_data.add_score(coin_value)
		queue_free()
