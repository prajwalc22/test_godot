extends Node

# Scene references
@onready var hud: CanvasLayer = $HUD
@onready var player: CharacterBody3D = $Spirit
@onready var cat: CharacterBody3D = $BlackCat
@onready var clown_body_interaction: Area3D = $ClownBody/InteractionArea

# Audio placeholder (can be connected to AudioStreamPlayer when audio files are available)
var wind_sound_enabled: bool = false

# Game state
var cat_spawned: bool = false

func _ready() -> void:
	# Hide the cat initially until the realization event
	cat.visible = false
	cat.process_mode = Node.PROCESS_MODE_DISABLED
	
	# Connect references
	if player.has_method("set_hud"):
		player.set_hud(hud)
	
	if clown_body_interaction:
		clown_body_interaction.set_hud(hud)
		clown_body_interaction.set_player(player)
		clown_body_interaction.interaction_completed.connect(_on_clown_body_interaction_completed)

func _on_clown_body_interaction_completed() -> void:
	## Handle completion of clown body interaction
	# Trigger subtle environment change (faint wind)
	_trigger_environment_change()
	
	# Spawn the cat after a brief moment
	await get_tree().create_timer(1.0).timeout
	_spawn_cat()

func _trigger_environment_change() -> void:
	## Trigger subtle environment changes like wind sound
	wind_sound_enabled = true
	# Placeholder for wind sound effect
	# When audio file is available, play it here:
	# $WindAudioPlayer.play()
	print("Environment change: faint wind sound triggered (placeholder)")

func _spawn_cat() -> void:
	## Spawn the cat and set the follow objective
	if cat_spawned:
		return
	
	cat_spawned = true
	cat.visible = true
	cat.process_mode = Node.PROCESS_MODE_INHERIT
	
	# Play a small sound effect (placeholder - sound would go here)
	# $CatSpawnAudioPlayer.play()
	print("Cat spawned with sound effect (placeholder)")
	
	# Set the objective
	hud.set_objective("Follow the cat.")

