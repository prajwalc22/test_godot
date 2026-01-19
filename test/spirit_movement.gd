extends CharacterBody3D

# Movement parameters
@export var speed: float = 5.0
@export var jump_velocity: float = 4.5
@export var mouse_sensitivity: float = 0.003
@export var gravity: float = 9.8

# Camera reference
@onready var camera: Camera3D = $Camera3D

# Animation references
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Camera rotation
var camera_rotation: Vector2 = Vector2.ZERO

# Monologue state
var has_moved: bool = false
var initial_monologue: String = "I woke up… but not really."
var hud: CanvasLayer = null

# Animation state
var current_animation: String = "idle"

func _ready() -> void:
	# Capture mouse for first-person controls
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# Initialize animation system if available
	if animation_tree:
		animation_tree.active = true

func _input(event: InputEvent) -> void:
	# Handle mouse movement for camera look
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera_rotation.x -= event.relative.y * mouse_sensitivity
		camera_rotation.y -= event.relative.x * mouse_sensitivity
		
		# Clamp vertical rotation to prevent camera flip
		camera_rotation.x = clamp(camera_rotation.x, -PI/2, PI/2)
		
		# Apply rotation
		rotation.y = camera_rotation.y
		camera.rotation.x = camera_rotation.x
	
	# Toggle mouse capture with Escape
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle jump (optional for future 3D navigation)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	
	# Get input direction relative to camera
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Check if player has moved for the first time
	if not has_moved and direction.length() > 0 and hud:
		has_moved = true
		_trigger_initial_monologue()
	
	# Apply movement
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		# Only set run animation if on ground
		if is_on_floor():
			_set_animation("run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		# Only set idle animation if on ground
		if is_on_floor():
			_set_animation("idle")
	
	# Handle jump animation (overrides other animations when airborne)
	if not is_on_floor():
		_set_animation("jump")
	
	move_and_slide()

func _trigger_initial_monologue() -> void:
	## Trigger the initial internal monologue
	if hud:
		hud.show_dialogue(initial_monologue)
		# Hide the monologue after a few seconds
		await get_tree().create_timer(3.0).timeout
		hud.hide_dialogue()

func set_hud(hud_node: CanvasLayer) -> void:
	## Set the HUD reference
	hud = hud_node

func _set_animation(animation_name: String) -> void:
	## Set the current animation if it has changed
	if not animation_tree or not animation_player:
		return  # Animation system not available, skip
	
	if current_animation != animation_name:
		current_animation = animation_name
		# Use AnimationTree state machine playback
		var playback = animation_tree.get("parameters/playback")
		if playback and playback is AnimationNodeStateMachinePlayback:
			# Check if the animation exists before attempting to play it
			if animation_player.has_animation(animation_name):
				playback.travel(animation_name)
			else:
				# Animation doesn't exist, log a warning but don't crash
				push_warning("Animation '%s' not found in AnimationPlayer" % animation_name)
