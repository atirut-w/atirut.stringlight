class_name StringLight
extends Light3D


var total_time := 0.0
var threshold := 1.0 / 10.0


func _physics_process(delta: float) -> void:
	total_time += delta
	if total_time >threshold:
		total_time = 0
		print(total_time)
