extends RigidBody3D

## How much vertical force to apply when moving.
@export_range(750.0, 3000.0) var thrust: float = 1000.0;
@export_range(20.0, 200.0) var torque_trust: float = 100.0;
@onready var explosion_audio: AudioStreamPlayer = $ExplosionAudio
@onready var success_audio: AudioStreamPlayer = $SuccessAudio

var is_transition: bool = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_force(basis.y * delta * thrust);
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque_trust) * delta);
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque_trust) * delta);

func _on_body_entered(body: Node) -> void:
	if (is_transition):
		return
		
	if (body.is_in_group("Goal")):
		complete_level(body.file_path);
		
	if (body.is_in_group("Hazard")):
		crash_sequence();

func crash_sequence() -> void:
	print("KABOOM");
	explosion_audio.play();
	is_transition = true;
	set_process(false);
	var tween = create_tween();
	tween.tween_interval(2.5);
	tween.tween_callback(get_tree().reload_current_scene);

func complete_level(next_level_file: String) -> void:
	print("Level Complete");
	success_audio.play();
	is_transition = true;
	var tween = create_tween();
	tween.tween_interval(1.0);
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file));
