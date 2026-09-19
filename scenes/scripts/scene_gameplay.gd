class_name SceneGameplay
extends BaseState

var _scene_instance: Node2D
var _player: PlayerTopDown

func enter() -> void:
	print("SceneGameplay enter()")
	
	_scene_instance = scene_resource.instantiate()
	
	if state_machine is SceneStateMachine and _scene_instance:
		state_machine.add_scene(_scene_instance)

func update(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		transition.emit("SceneTitleMenu")

func exit() -> void:
	print("SceneTitleMenu exit()")
	
	if state_machine is SceneStateMachine and _scene_instance:
		state_machine.remove_scene(_scene_instance)
