extends Button
@export var potionName: String;
@export var iconPic: String;
@onready var slots: Array = $"../../NinePatchRect/GridContainer".get_children()
@onready var ingredientSlots: Array = $"../../Ingredients/GridContainer".get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = potionName
	$icon.texture = load(iconPic)
	$icon.scale = Vector2(0.2, 0.2)
		
func show_ingredients(potionName: String):
	print("CALLING SHOW INGREDIENTS")
	var ingredientKeys = global.recipes[potionName].keys()
	# not ideal but should work to clear all items before adding new images
	for i in range(ingredientSlots.size()):
		ingredientSlots[i].updateIngredients(0, "")
		
	for i in range(ingredientKeys.size()):
		var ingredient = ingredientKeys[i]
		var num = global.recipes[potionName][ingredient][0]
		var imagePath = global.recipes[potionName][ingredient][1]
		ingredientSlots[i].updateIngredients(num, imagePath)
		

func _on_pressed():
	print("you pressed a potion type") # Replace with function body.
	print("potion name", potionName)
	print("potion ingredients", global.recipes[potionName])
	global.selectedPotion = potionName
	show_ingredients(potionName)
	
