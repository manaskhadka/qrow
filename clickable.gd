# Attach this script to any Area2D object that represents an interactable

extends Area2D
var entered = false

# Set this to the sprite that this interactable area is related to
# TODO: This is better for testing purposes but we might want to auto grab this in on_ready
@export var sprite : Sprite2D;

# Set the correct type of object this is
@export_enum("Character", "Item-Collectable-Infinite", "Item-Collectable-Finite", "Item-Viewable") var obj_type

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
	entered = false
	sprite.material.set_shader_parameter("outline_enabled", false)
	
func add():
	if global.items.size() == 0:
		var inventory_slot = InventorySlot.new()
		inventory_slot.texture = sprite.texture
		inventory_slot.amount = 1
		global.items.append(inventory_slot)
		return
	else:
		for i in range(global.items.size()):
			if global.items[i].texture == sprite.texture:
				global.items[i].amount += 1
				return

		var inventory_slot = InventorySlot.new()
		inventory_slot.texture = sprite.texture
		inventory_slot.amount = 1
		global.items.append(inventory_slot)
		return

func _input(event):
	if entered and event is InputEventMouseButton and event.pressed == true:
		print("pressed")
		if dialogue_file:
			use_dialogue()
		
		if obj_type == 1:	
			add()
			
		if obj_type == 2:
			queue_free()
			add()
			
		if transition_scene:
			get_tree().change_scene_to_file(transition_scene)
		
func _process(delta):
	if entered == true and len(get_overlapping_areas()) > 0:
		sprite.material.set_shader_parameter("outline_enabled", true)
		pass

func use_dialogue():
	var dialogue = get_parent().get_node("Crow").get_node("Dialogue")
	dialogue.dialogue_file = dialogue_file
	if dialogue_file:
		dialogue.start()


func _on_mouse_entered():
	print("entered") # Replace with function body.
	if (interactable_area_name): 
		print("Entered interactable area:", interactable_area_name)
	entered = true
	sprite.material.set_shader_parameter("outline_enabled", true)


func _on_mouse_exited():
	print("exited") # Replace with function body.
	if (interactable_area_name): 
		print("Exited interactable area:", interactable_area_name)
	entered = false 
	sprite.material.set_shader_parameter("outline_enabled", false)


