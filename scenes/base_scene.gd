extends Node3D

var sensor_ball_prefab := preload("res://scenes/sensor_ball.tscn")

var current_time := 0.0
var running := false
var sensors: Dictionary = {}
var events: Array[EventData]
var current_index := 0

func _process(delta: float) -> void:
	if running:
		while self.current_index < events.size() && events[self.current_index].time <= current_time:
			sensors[events[self.current_index].sensor_id].set_color(Color.RED)
			current_index += 1
		current_time += delta

func create_sensor_balls(sensors_data: Array[SensorBallData]):
	var root_node := Node3D.new()
	root_node.name = "sensor_array"
	self.add_child(root_node)
	for sensor_data in sensors_data:
		var new_sensor: SensorBall = sensor_ball_prefab.instantiate()
		self.sensors[sensor_data.id] = new_sensor
		new_sensor.name = "sensor_" + str(sensor_data.id)
		new_sensor.position = sensor_data.position
		new_sensor.id = sensor_data.id
		root_node.add_child(new_sensor)



func _on_create_sensor_array_pressed() -> void:
	var sensores_arr: Array[SensorBallData] = []
	var id = 0
	for x in range(0,10):
		for y in range(0,10):
			for z in range(0,50):
				sensores_arr.push_back(SensorBallData.new(Vector3(x,y,z), id))
				id += 1
	create_sensor_balls(sensores_arr)


func generate_event() -> Array[EventData]:
	var arr : Array[EventData] = []
	for key in self.sensors:
		var value = sensors[key]
		var new_event = EventData.new(value.position.length(), value.id)
		arr.push_back(new_event)
	return arr
		

func _on_start_event_pressed() -> void:
	running = true
	self.events = generate_event()
	self.events.sort_custom(func(a,b): return a.time < b.time)


