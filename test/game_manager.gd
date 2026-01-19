extends Node

# Scene references
@onready var hud: CanvasLayer = $HUD
@onready var player: CharacterBody3D = $Spirit
@onready var cat: CharacterBody3D = $BlackCat
@onready var clown_body_interaction: Area3D = $ClownBody/InteractionArea

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
	"""Handle completion of clown body interaction"""
	# Spawn the cat after a brief moment
	await get_tree().create_timer(1.0).timeout
	_spawn_cat()

func _spawn_cat() -> void:
	"""Spawn the cat and set the follow objective"""
	if cat_spawned:
		return
	
	cat_spawned = true
	cat.visible = true
	cat.process_mode = Node.PROCESS_MODE_INHERIT
	
	# Play a small sound effect (placeholder - sound would go here)
	# For now, we'll just show the objective
	
	# Set the objective
	hud.set_objective("Follow the cat.")
