# Attach this script to any Area2D object that represents an interactable

extends Area2D
var entered = false

# Set this to the sprite that this interactable area is related to
# TODO: This is better for testing purposes but we might want to auto grab this in on_ready
@export var sprite : Sprite2D;

# Set the correct type of object this is
enum {CHARACTER, ITEM_C, ITEM_V}
@export_enum("Character", "Item-Collectable", "Item-Viewable") var obj_type

# Set to the file location holding the dialogue if it exists
@export_file("*.json") var dialogue_file

# Set this if you want to manually set dialogue (for small snippets)
@export var text : String = ""

# Set this if this interactable should transition us into another scene
# (This would be for close-ups of items as well as level transitions)
@export_file("*.tscn") var transition_scene

# For debugging purposes:
@export var interactable_area_name : String;

var shader = preload("res://world.gdshader")
func _ready():
	# $object.texture = load(image)
	if (not sprite): 
		print("ERROR: You did not attach a sprite to an interactable area")
	
	sprite.material = ShaderMaterial.new()
	sprite.material.shader = shader
	entered = false
	sprite.material.set_shader_parameter("outline_enabled", false)
		
func _on_body_entered(body):
	if (interactable_area_name): 
		print("Entered interactable area:", interactable_area_name)
	entered = true
	global.hideRegularInventory = true
	
func _on_body_exited(body):
	if (interactable_area_name): 
		print("Exited interactable area:", interactable_area_name)
	entered = false 
	sprite.material.set_shader_parameter("outline_enabled", false)
	global.hideRegularInventory = false

func _input(event):
	if entered and event.is_action_pressed("i") and len(get_overlapping_areas()) > 0:
		print("you entered the cauldron")
		
		
func _process(delta):
	if entered == true and len(get_overlapping_areas()) > 0:
		sprite.material.set_shader_parameter("outline_enabled", true)

