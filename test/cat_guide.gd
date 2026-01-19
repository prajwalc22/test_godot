extends CharacterBody3D

# Reference to the player
@export var player: NodePath
var player_node: Node3D = null

# Pathfinding waypoints
@export var waypoints: Array[NodePath] = []
var waypoint_nodes: Array[Node3D] = []
var current_waypoint_index: int = 0

# Movement parameters
@export var move_speed: float = 3.0
@export var wait_distance: float = 3.0  # Distance to wait for player
@export var next_waypoint_distance: float = 0.5  # Distance to consider waypoint reached
@export var gravity: float = 9.8

# Behavior parameters
@export var look_back_interval: float = 3.0  # How often to look back at player
@export var look_back_duration: float = 1.5  # How long to look at player
@export var meow_interval: float = 5.0  # How often to meow (placeholder for sound)

# Internal state
var is_waiting: bool = false
var look_back_timer: float = 0.0
var is_looking_back: bool = false
var look_back_time: float = 0.0
var meow_timer: float = 0.0

func _ready() -> void:
	# Get the player node
	if player:
		player_node = get_node(player)
	
	# Get waypoint nodes from NodePaths
	for waypoint_path in waypoints:
		var waypoint = get_node(waypoint_path)
		if waypoint:
			waypoint_nodes.append(waypoint)

func _physics_process(delta: float) -> void:
	if not player_node or waypoint_nodes.is_empty():
		return
	
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Update timers
	look_back_timer += delta
	meow_timer += delta
	
	# Check if we've reached all waypoints
	if current_waypoint_index >= waypoint_nodes.size():
		_idle_behavior(delta)
		move_and_slide()
		return
	
	var current_waypoint = waypoint_nodes[current_waypoint_index]
	var distance_to_waypoint = global_position.distance_to(current_waypoint.global_position)
	var distance_to_player = global_position.distance_to(player_node.global_position)
	
	# Check if player is too far behind
	if distance_to_player > wait_distance:
		is_waiting = true
		_wait_for_player(delta)
	else:
		is_waiting = false
		
		# Move to next waypoint if close enough
		if distance_to_waypoint < next_waypoint_distance:
			current_waypoint_index += 1
			look_back_timer = 0.0  # Reset look back timer when reaching waypoint
		else:
			_move_to_waypoint(current_waypoint, delta)
	
	# Handle look back behavior
	if look_back_timer >= look_back_interval and not is_looking_back:
		is_looking_back = true
		look_back_time = 0.0
		look_back_timer = 0.0
	
	if is_looking_back:
		look_back_time += delta
		_look_at_player()
		if look_back_time >= look_back_duration:
			is_looking_back = false
	
	# Placeholder for meow sound
	if meow_timer >= meow_interval:
		_meow()
		meow_timer = 0.0
	
	move_and_slide()

func _move_to_waypoint(waypoint: Node3D, delta: float) -> void:
	var direction = (waypoint.global_position - global_position)
	direction.y = 0  # Keep movement horizontal
	direction = direction.normalized()  # Normalize after zeroing Y
	
	velocity.x = direction.x * move_speed
	velocity.z = direction.z * move_speed
	
	# Face movement direction when not looking back
	if not is_looking_back and direction.length() > 0.01:
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, delta * 5.0)

func _wait_for_player(delta: float) -> void:
	# Stop moving
	velocity.x = move_toward(velocity.x, 0, move_speed)
	velocity.z = move_toward(velocity.z, 0, move_speed)
	
	# Look at player while waiting
	_look_at_player()

func _look_at_player() -> void:
	if not player_node:
		return
	
	var direction = (player_node.global_position - global_position)
	direction.y = 0
	direction = direction.normalized()  # Normalize after zeroing Y
	
	if direction.length() > 0.01:
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = target_rotation

func _idle_behavior(delta: float) -> void:
	# Cat has reached all waypoints, just wait for player
	velocity.x = move_toward(velocity.x, 0, move_speed)
	velocity.z = move_toward(velocity.z, 0, move_speed)
	
	# Occasionally look at player
	if look_back_timer >= look_back_interval:
		_look_at_player()

func _meow() -> void:
	# Placeholder for meow sound effect
	# In the future, this will play an audio cue
	pass
