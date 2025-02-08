extends Node3D

var sensor_ball_prefab := preload("res://scenes/sensor_ball.tscn")
@onready var open_array_coords := %open_array_coords

func _on_create_sensor_array_pressed() -> void:
	print("pick sensor array file")
	open_array_coords.current_dir = "~/"
	open_array_coords.visible = true


func _on_open_array_coords_file_selected(path:String) -> void:
	print(path)
	var array_file := FileAccess.open(path, FileAccess.READ)
	var line := 0
	while !array_file.eof_reached():
		line += 1
		var csv_line = array_file.get_csv_line()
		if csv_line.size() == 0:
			continue
		if csv_line.size() == 1 && csv_line[0] == "":
			continue
		if csv_line.size() < 5:
			print(csv_line)
			printerr("Error in csv file at " + path + " line " + str(line) + " has " + str(csv_line.size()) + " fields instead of 5")
			return
		# var line_id := csv_line[0]
		# var ball_id := csv_line[1]
		var x := float(csv_line[2])
		var y := float(csv_line[4])
		var z := float(csv_line[3])
		var new_ball : SensorBall = sensor_ball_prefab.instantiate()
		self.add_child(new_ball)
		new_ball.global_position = Vector3(x, y, z)
