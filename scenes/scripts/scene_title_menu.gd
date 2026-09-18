class_name SceneTitleMenu
extends BaseState

var _scene_instance: Node2D

func enter() -> void:
	print("SceneTitleMenu enter()")
	
	_scene_instance = scene_resource.instantiate()
	
	if state_machine is SceneStateMachine and _scene_instance:
		state_machine.add_scene(_scene_instance)

func update(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		transition.emit("SceneGameplay")

func exit() -> void:
	print("SceneTitleMenu exit()")
	
	if state_machine is SceneStateMachine and _scene_instance:
		state_machine.remove_scene(_scene_instance)
