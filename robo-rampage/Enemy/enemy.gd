extends CharacterBody3D
class_name Enemy

const SPEED = 5.0;

@export var attack_range := 1.5;
@export var max_hitpoints := 100;
@export var attack_damage := 20;

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]


var player: Node3D;
var provoked := false;
var aggro_range := 12.0;
var hitpoints: int = max_hitpoints:
	set(value):
		hitpoints = value;
		if (hitpoints <= 0):
			queue_free();
		provoked = true;

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	if (provoked):
		navigation_agent_3d.target_position = player.global_position;

func _physics_process(delta: float) -> void:
	var next_position = navigation_agent_3d.get_next_path_position();
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	
	var direction = global_position.direction_to(next_position);
	var distance = global_position.distance_to(player.global_position);
	
	if (distance <= aggro_range):
		provoked = true;
	
	if (provoked):
		if (distance <= attack_range):
			playback.travel("Attack");
			
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		look_at_target(direction);
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func look_at_target(direction: Vector3) -> void:
	var adjusted_direction = direction;
	adjusted_direction.y = 0;
	look_at(global_position + adjusted_direction, Vector3.UP, true);

func attack() -> void:
	player.hitpoints -= attack_damage;
