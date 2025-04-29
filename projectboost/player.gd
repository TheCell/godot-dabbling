extends RigidBody3D

## How much vertical force to apply when moving.
@export_range(750.0, 3000.0) var thrust: float = 1000.0;

@export_range(20.0, 200.0) var torque_trust: float = 100.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_force(basis.y * delta * thrust);
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque_trust) * delta);
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque_trust) * delta);

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Goal"):
		complete_level(body.file_path);
		
	if body.is_in_group("Hazard"):
		crash_sequence();

func crash_sequence() -> void:
	print("KABOOM");
	get_tree().reload_current_scene();

func complete_level(next_level_file: String) -> void:
	print("Level Complete");
	get_tree().change_scene_to_file(next_level_file)
