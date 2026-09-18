class_name PlayerTopDown
extends CharacterBody2D

@export var speed = 300.0

var interactable_object: Node2D

func _process(delta):
	#if interactable_object:
		#print("there is")
	#else:
		#print("no inter")
		
	if not interactable_object:
		return
		
	if Input.is_action_just_pressed("interact"):
		print("INTERACTED!!!!!!!!!!!!!!!!!")

func _physics_process(delta) -> void:
	var input_direction: Vector2 = Input.get_vector(
		"move_left", "move_right", "move_up","move_down")
	
	# print(input_direction)
	
	velocity = input_direction * speed
	move_and_slide()
