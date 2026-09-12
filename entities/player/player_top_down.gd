class_name PlayerTopDown
extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta) -> void:
	var input_direction: Vector2 = Input.get_vector(
		"move_left", "move_right", "move_up","move_down")
	
	# print(input_direction)
	
	velocity = input_direction * speed
	move_and_slide()
