@tool
extends Control


var sensor_ball_prefab := preload("res://scenes/sensor_ball.tscn")

func create_sensor_balls(sensor_coordinates: Array[Vector3]):
	var root_node := Node3D.new()
	root_node.name = "sensor_array"
	for sensor_coordinate in sensor_coordinates:
		var new_sensor: SensorBall = sensor_ball_prefab.instantiate()
		new_sensor.position = sensor_coordinate
		root_node.add_child(new_sensor)
		new_sensor.owner = root_node
	var packed_scene := PackedScene.new()
	packed_scene.pack(root_node)
	ResourceSaver.save(packed_scene, "res://test.tscn")
	EditorInterface.open_scene_from_path("res://test.tscn")

func _on_create_button_pressed() -> void:
	create_sensor_balls([Vector3(10,0,0), Vector3(0,0,10), Vector3(0,10,0)])
