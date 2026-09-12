class_name PlayerAdvancedPlatformer
extends CharacterBody2D

## Classic platformer movement: run left/right, jump, gravity.
## Ground detection via is_on_floor() (needs CollisionShape2D + floor).

@export var move_speed: float = 300.0
@export var acceleration: float = 2000.0
@export var friction: float = 2000.0
@export var jump_velocity: float = -450.0
@export var gravity: float = 1200.0
@export var max_fall_speed: float = 800.0

# Optional jump buffering & coyote time (feels better!)
@export var coyote_time: float = 0.1
@export var jump_buffer_time: float = 0.1

var _coyote_timer: float = 0.0
var _jump_buffer_timer: float = 0.0

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump(delta)
	_handle_horizontal(delta)
	move_and_slide()

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)
	else:
		_coyote_timer = coyote_time

func _handle_jump(delta: float) -> void:
	# Update timers
	if not is_on_floor():
		_coyote_timer = max(_coyote_timer - delta, 0.0)
	
	if Input.is_action_just_pressed("jump"):
		_jump_buffer_timer = jump_buffer_time
	else:
		_jump_buffer_timer = max(_jump_buffer_timer - delta, 0.0)
	
	# Jump if buffered + allowed (coyote time)
	if _jump_buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = jump_velocity
		_jump_buffer_timer = 0.0
		_coyote_timer = 0.0
	
	# Variable jump height (release early = shorter jump)
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5

func _handle_horizontal(delta: float) -> void:
	var input_dir := Input.get_axis("move_left", "move_right")
	
	if input_dir != 0.0:
		velocity.x = move_toward(
			velocity.x, input_dir * move_speed, acceleration * delta
		)
	else:
		velocity.x = move_toward(velocity.x, 0.0, friction * delta)
