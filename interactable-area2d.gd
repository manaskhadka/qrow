# Attach this script to any Area2D object that represents an interactable

extends Area2D
var entered = false

# Set this to the sprite that this interactable area is related to
@export var sprite : Sprite2D;

# Set to true if the interactable is a person with dialogue
@export var is_char : bool = false 

# Set to the file location holding the dialogue if it exists
@export_file("*.json") var dialogue_file

# Set this if you want to manually set dialogue (for small snippets)
@export var text : String = ""

# Set this if this interactable should transition us into another scene
# (This would be for close-ups of items as well as level transitions)
@export_file("*.tscn") var transition_scene

# For debugging purposes:
@export var interactable_area_name : String;

func _ready():
	# $object.texture = load(image)
	pass
		
func _on_body_entered(body):
	if (interactable_area_name): 
		print("Entered interactable area:", interactable_area_name)
	entered = true
	
func _on_body_exited(body):
	if (interactable_area_name): 
		print("Exited interactable area:", interactable_area_name)
	entered = false 
	sprite.material.set_shader_parameter("outline_enabled", false)

func _input(event):
	if entered and event.is_action_pressed("ui_accept"):
		if dialogue_file:
			use_dialogue()
		
		if transition_scene:
			get_tree().change_scene_to_file(transition_scene)
		
func _process(delta):
	if entered == true:
		sprite.material.set_shader_parameter("outline_enabled", true)

func use_dialogue():
	var dialogue = get_parent().get_node("Crow").get_node("Dialogue")
	dialogue.dialogue_file = dialogue_file
	if dialogue_file:
		dialogue.start()
