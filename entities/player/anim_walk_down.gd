class_name AnimWalkDownState
extends BaseState

@onready var anim_sprite = $"../../AnimatedSprite2D"

func enter() -> void:
	anim_sprite.play("WalkDown")

func exit() -> void:
	pass
