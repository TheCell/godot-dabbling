extends Node2D

@onready var sprite = $Sprite2D;

#func _process(delta: float) -> void:
	#var time = Time.get_ticks_msec() / 1000.0;
	#var a = (sin(time) + 1.0) * 0.5;
	#
	#print("TIME: " + str(time));
	#print("a: " + str(a));

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("set_speed")):
		var new_speed = randf_range(1.0, 10.0);
		sprite.material.set_shader_parameter("my_float", new_speed);
		print("new speed: " + str(new_speed));
	
	if (Input.is_action_just_pressed("set_color")):
		var new_color = Vector4(randf(), randf(), randf(), 1.0);
		sprite.material.set_shader_parameter("my_color", new_color);
		print("new_color: " + str(new_color));
		
	#print(sprite.material.get_shader_parameter("my_int"));
