class_name Interactable
extends Area2D

func _ready():
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	$InteractUI.visible = false
	
func on_body_entered(body: Node2D):
	if body is PlayerTopDown:
		print("Interact enter...")
		$InteractUI.visible = true
		body.interactable_object = self

func on_body_exited(body: Node):
	if body is PlayerTopDown:
		print("Interact exit")
		$InteractUI.visible = false
		body.interactable_object = null
