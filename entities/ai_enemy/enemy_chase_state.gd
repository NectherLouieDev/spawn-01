class_name EnemyChaseState
extends BaseState


var speed: float = 100.0
@export var stop_distance: float = 5.0

var _target: PlayerTopDown

@onready var enemy_character = $"../.."
@onready var chase_area_trigger = $"../../ChaseTriggerArea"


func enter() -> void:
	print("EnemyChaseState enter()")
	if state_machine is EnemyStateMachine:
		_target = state_machine.target_player
	
	chase_area_trigger.body_exited.connect(on_chase_exit)

func on_chase_exit(body: Node2D):
	if body is PlayerTopDown:
		if state_machine is EnemyStateMachine:
			state_machine.target_player = null
			transition.emit("EnemyIdleState")

func physics_update(delta: float) -> void:
	if not _target:
		return
	
	# Distance between 2 points
	var distance:float = enemy_character.global_position.distance_to(_target.global_position)
	
	# Stop when we arrived
	if distance < stop_distance:
		enemy_character.global_position = _target.global_position
		stop()
		enemy_character.move_and_slide()
		return
	
	# Move to target
	var direction: Vector2 = _target.global_position - enemy_character.global_position
	var new_velocity = direction.normalized() * speed 
	enemy_character.velocity = new_velocity
	enemy_character.move_and_slide()

func exit() -> void:
	print("EnemyChaseState exit()")
	chase_area_trigger.body_exited.disconnect(on_chase_exit)

func stop() -> void:
	enemy_character.velocity = Vector2.ZERO
