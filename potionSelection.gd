extends Button
@export var potionName: String;
@onready var slots: Array = $"../../NinePatchRect/GridContainer".get_children()
@onready var ingredientSlots: Array = $"../../Ingredients/GridContainer".get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = potionName
	
func check_if_can_make(potionName: String):
	for ingredient in global.recipes[potionName].keys():
		if !global.items.has(ingredient):
			print("not enough to make potion, sorry")
			return
			
		print("yay you can make the potion")
		global.items[ingredient].amount -= 1
		if global.items[ingredient].amount == 0:
			global.items.erase(ingredient)
			
		# seeing if I can register an automatic update or not
		var min = min(global.items.size(), slots.size())
		# this is unideal but it works
		for i in range(slots.size()):
			slots[i].update(null)
			
		for i in range(min):
			var keys = global.items.keys()
			var key = keys[i]
			print(global.items)
			print(global.items.size())
			slots[i].update(global.items[key])
		
func show_ingredients(potionName: String):
	print("CALLING SHOW INGREDIENTS")
	var ingredientKeys = global.recipes[potionName].keys()
	for i in range(ingredientKeys.size()):
		var ingredient = ingredientKeys[i]
		var num = global.recipes[potionName][ingredient][0]
		var imagePath = global.recipes[potionName][ingredient][1]
		ingredientSlots[i].updateIngredients(num, imagePath)
		

func _on_pressed():
	print("you pressed a potion type") # Replace with function body.
	print("potion name", potionName)
	print("potion ingredients", global.recipes[potionName])
	check_if_can_make(potionName)
	show_ingredients(potionName)
	
