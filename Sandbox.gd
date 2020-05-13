extends Node2D

onready var nav_2d : Navigation2D = $Navigation2D
onready var character : KinematicBody2D = $Player

func _unhandled_input(event : InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return

	var new_path : = nav_2d.get_simple_path(character.position, get_global_mouse_position())
	character.path = new_path
