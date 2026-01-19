extends CharacterBody3D

# Reference to the player
@export var target: NodePath
var player: Node3D = null

# Follow parameters
@export var follow_speed: float = 3.0
@export var follow_distance: float = 2.0

func _ready() -> void:
	# Get the player node
	if target:
		player = get_node(target)

func _physics_process(delta: float) -> void:
	if not player:
		return
	
	# Calculate distance to player
	var distance_to_player := global_position.distance_to(player.global_position)
	
	# Only follow if beyond the follow distance
	if distance_to_player > follow_distance:
		# Calculate direction to player
		var direction := (player.global_position - global_position).normalized()
		
		# Move towards player
		velocity.x = direction.x * follow_speed
		velocity.z = direction.z * follow_speed
	else:
		# Stop when close enough
		velocity.x = move_toward(velocity.x, 0, follow_speed)
		velocity.z = move_toward(velocity.z, 0, follow_speed)
	
	move_and_slide()
