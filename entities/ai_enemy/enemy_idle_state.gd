class_name EnemeyIdleState
extends BaseState

@onready var chase_area_trigger = $"../../ChaseTriggerArea"

func enter() -> void:
	print("EnemyIdleState enter()")
	chase_area_trigger.body_entered.connect(on_chase_triggered)

func on_chase_triggered(body: Node2D):
	if body is PlayerTopDown:
		if state_machine is EnemyStateMachine:
			state_machine.target_player = body
			transition.emit("EnemyChaseState")

func exit() -> void:
	print("EnemyIdleState exit()")
	chase_area_trigger.body_entered.disconnect(on_chase_triggered)
