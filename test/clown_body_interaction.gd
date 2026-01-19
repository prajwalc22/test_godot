extends Area3D

# Signals
signal interaction_completed

# References
var hud: CanvasLayer = null
var player: Node3D = null

# State
var has_interacted: bool = false
var proximity_message_shown: bool = false
var interaction_enabled: bool = true

# Parameters
@export var interaction_distance: float = 2.0
@export var proximity_message: String = "That's… me."

# Dialogue options
var dialogue_options: Array = [
	"Am I dead?",
	"Why can't I feel anything?",
	"What happened?"
]
var realization_text: String = "I don't remember."

func _ready() -> void:
	# Connect area signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta: float) -> void:
	if not interaction_enabled or not player or not hud:
		return
	
	var distance = global_position.distance_to(player.global_position)
	
	# Show proximity message when player is near
	if distance <= interaction_distance and not proximity_message_shown and not has_interacted:
		_show_proximity_message()
	elif distance > interaction_distance and proximity_message_shown and not has_interacted:
		_hide_proximity_message()

func _show_proximity_message() -> void:
	## Show the initial proximity message
	proximity_message_shown = true
	hud.show_dialogue(proximity_message)
	
	# After a delay, show dialogue options
	await get_tree().create_timer(2.0).timeout
	if proximity_message_shown and not has_interacted:
		_show_dialogue_options()

func _hide_proximity_message() -> void:
	## Hide proximity message when player moves away
	proximity_message_shown = false
	if not has_interacted:
		hud.hide_dialogue()

func _show_dialogue_options() -> void:
	## Show dialogue options for the player to choose
	hud.show_dialogue("", dialogue_options, _on_dialogue_option_selected)

func _on_dialogue_option_selected(option: String) -> void:
	## Handle dialogue option selection
	# Show realization text regardless of choice
	hud.show_dialogue(realization_text)
	has_interacted = true
	
	# Hide dialogue after a moment and trigger completion
	await get_tree().create_timer(3.0).timeout
	hud.hide_dialogue()
	_complete_interaction()

func _complete_interaction() -> void:
	## Complete the interaction and trigger environment changes
	interaction_enabled = false
	interaction_completed.emit()
	
	# Trigger subtle environment changes (faint wind sound would go here)
	# For now, we'll just emit the signal for other systems to respond

func _on_body_entered(body: Node3D) -> void:
	## Track when player enters the area
	if body.name == "Spirit":
		player = body

func _on_body_exited(body: Node3D) -> void:
	## Track when player exits the area
	if body.name == "Spirit":
		player = null
		_hide_proximity_message()

func set_hud(hud_node: CanvasLayer) -> void:
	## Set the HUD reference
	hud = hud_node

func set_player(player_node: Node3D) -> void:
	## Set the player reference
	player = player_node
