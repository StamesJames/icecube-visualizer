@tool
extends EditorPlugin

var builder_ui

func _enter_tree() -> void:
	builder_ui = preload("res://addons/build_ice_cube_array/ice_cube_builder_interface.tscn").instantiate()
	add_control_to_bottom_panel(builder_ui, "Ice Cube Sensor Array Builder").visible = true


func _exit_tree() -> void:
	remove_control_from_bottom_panel(builder_ui)