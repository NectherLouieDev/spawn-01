class_name MouseClickable
extends Area2D

## Makes Area2D behave like a button in the game world
## Hover, Press, Release, Click
## Emits signals accordingly

signal hover_started
signal hover_ended
signal pressed
signal released
signal clicked

@export var detect_hover: bool = true

# State
var is_hovered: bool = false
var is_pressed: bool = false

func _ready() -> void:
	input_pickable = true;
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered() -> void:
	if not detect_hover:
		return
	
	is_hovered = true
	hover_started.emit()

func _on_mouse_exited() -> void:
	if not detect_hover:
		return
	
	is_hovered = false
	
	# Edge case
	# if mouse leaves while button is press. cancel press
	if is_pressed:
		is_pressed = false
		released.emit()
	
	hover_ended.emit()

func _input_event(viewport, event, shape_idx) -> void:
	# Only fires when mouse is over THIS Area2D's shape
	if event is InputEventMouseButton:
		if event.button_index != MOUSE_BUTTON_LEFT:
			return
		
		if event.pressed:
			_on_press()
		else:
			_on_release()

func _on_press() -> void:
	is_pressed = true
	pressed.emit()

func _on_release() -> void:
	if is_pressed and is_hovered:
		clicked.emit()
	
	is_pressed = false
	released.emit()

# public API
func set_enabled(value: bool) -> void:
	input_pickable = value
	if not value:
		is_hovered = false
		is_pressed = false
