class_name BaseState
extends Node

signal transition(new_state_name: StringName)

@export var scene_resource: PackedScene

var state_machine: StateMachine

func _ready()-> void:
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
