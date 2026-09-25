class_name AnimWalkUpState
extends BaseState

@onready var anim_sprite = $"../../AnimatedSprite2D"

func enter() -> void:
	anim_sprite.play("WalkUp")

func exit() -> void:
	pass
