class_name PlayerClickMove
extends CharacterBody2D

## Click anywhere → walk to that position.

@export var speed: float = 300.0
@export var stop_distance: float = 5.0

var _target_position: Vector2
var _has_target: bool = false

func _ready():
	_target_position = global_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# Set the target when wherever we click with left mouse button
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var mouse_position: Vector2 = get_global_mouse_position()
			_set_target(mouse_position)

func _physics_process(delta) -> void:
	if not _has_target:
		return
	
	# Distance between 2 points
	var distance := global_position.distance_to(_target_position)
	
	# Stop when we arrived
	if distance < stop_distance:
		global_position = _target_position
		stop()
		move_and_slide()
		return
	
	# Move towards target
	# Direction calculation between 2 points
	# Normalize is calculated as the diff between the 2 points 
	# divided by the distance between the 1 points
	var direction := (_target_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func _set_target(pos: Vector2) -> void:
	_target_position = pos
	_has_target = true

func stop() -> void:
	_has_target = false
	velocity = Vector2.ZERO
