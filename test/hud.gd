extends CanvasLayer

# UI elements
@onready var objective_label: Label = $ObjectiveContainer/ObjectiveLabel
@onready var dialogue_panel: Panel = $DialoguePanel
@onready var dialogue_text: Label = $DialoguePanel/DialogueText
@onready var dialogue_options: VBoxContainer = $DialoguePanel/DialogueOptions

# State
var current_dialogue_options: Array = []
var dialogue_callback: Callable

func _ready() -> void:
	# Hide dialogue panel initially
	dialogue_panel.visible = false
	
func set_objective(text: String) -> void:
	## Update the objective display
	objective_label.text = text
	objective_label.visible = text != ""

func show_dialogue(text: String, options: Array = [], callback: Callable = Callable()) -> void:
	## Show dialogue with optional choices
	dialogue_text.text = text
	dialogue_callback = callback
	
	# Clear previous options
	for child in dialogue_options.get_children():
		child.queue_free()
	
	# Add new options if provided
	if options.size() > 0:
		for option in options:
			var button = Button.new()
			button.text = option
			button.pressed.connect(_on_option_selected.bind(option))
			dialogue_options.add_child(button)
		dialogue_options.visible = true
	else:
		dialogue_options.visible = false
	
	dialogue_panel.visible = true

func hide_dialogue() -> void:
	## Hide the dialogue panel
	dialogue_panel.visible = false

func _on_option_selected(option: String) -> void:
	## Handle dialogue option selection
	if dialogue_callback.is_valid():
		dialogue_callback.call(option)
	hide_dialogue()
