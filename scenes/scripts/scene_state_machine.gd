class_name SceneStateMachine
extends StateMachine

@export var root_scene: Node2D

var scenes: Dictionary[StringName, Node2D]

func add_scene(child: Node2D) -> void:
	root_scene.add_child(child)

func remove_scene(child: Node2D) -> void:
	root_scene.remove_child(child)
