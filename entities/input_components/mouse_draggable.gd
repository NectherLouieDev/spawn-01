class_name MouseDraggable
extends Area2D

## Click and hold to drag this object. Release to drop
## Emits signals for drag

signal drag_started
signal drag_moved(new_position: Vector2)
signal drag_ended

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

var _original_position: Vector2

func _ready() -> void:
	input_pickable = true
	

func _input_event(viewport, event, shape_idx) -> void:
	# Only called when the mouse is over THIS Area2D's shape
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_start_drag()

func _input(event):
	if not is_dragging:
		return
	
	# Moving or Dragging
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position()
		global_position = mouse_position + drag_offset
		drag_moved.emit(global_position)
	# Left Button Released
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			_end_drag()

# API
func _start_drag() -> void:
	is_dragging = true
	_original_position = global_position
	var mouse_position = get_global_mouse_position()
	drag_offset = global_position - mouse_position
	
	drag_started.emit()
	
func _end_drag() -> void:
	is_dragging = false
	
	if not _is_valid_drop():
		global_position = _original_position
		
	drag_ended.emit()

# Override this for valid drpo areas
func _is_valid_drop() -> bool:
	return true
