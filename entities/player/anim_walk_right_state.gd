class_name AnimWalkRightState
extends BaseState

@onready var anim_sprite = $"../../AnimatedSprite2D"

func enter() -> void:
	anim_sprite.play("WalkRight")

func exit() -> void:
	pass
