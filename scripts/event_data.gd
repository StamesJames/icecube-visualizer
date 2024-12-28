class_name EventData

var time: float
var sensor_id: int 

func _init(_time: float, _sensor_id:int) -> void:
    self.time = _time
    self.sensor_id = _sensor_id