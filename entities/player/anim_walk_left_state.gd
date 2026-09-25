class_name AnimWalkLeftState
extends BaseState

@onready var anim_sprite = $"../../AnimatedSprite2D"

func enter() -> void:
	anim_sprite.play("WalkLeft")

func exit() -> void:
	pass
