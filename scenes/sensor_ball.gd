extends Node3D
class_name SensorBall

var id : int = 0

@onready var ball : MeshInstance3D = %ball


func set_color(color:Color):
	ball.get_surface_override_material(0).albedo_color = color

