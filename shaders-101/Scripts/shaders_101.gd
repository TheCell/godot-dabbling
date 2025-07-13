extends Node2D

func _process(delta: float) -> void:
	var time = Time.get_ticks_msec() / 1000.0;
	
	print("TIME: " + str(time));
