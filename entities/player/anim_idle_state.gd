class_name AnimIdleState
extends BaseState

@onready var anim_sprite = $"../../AnimatedSprite2D"

func enter() -> void:
	anim_sprite.play("Idle")

func exit() -> void:
	pass
