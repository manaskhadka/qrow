extends Button
@onready var slots: Array = $"../NinePatchRect/GridContainer".get_children()
@onready var ingredientSlots: Array = $"../Ingredients/GridContainer".get_children()
var messageVisible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	messageVisible = false
	$"../PotionMessage".visible = messageVisible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func check_if_can_make(potionName: String):
	if potionName == "":
			$"../PotionMessage".message = "You must first choose a potion to create it"
			$"../PotionMessage".visible = true
			return
		
	for ingredient in global.recipes[potionName].keys():
		if !global.items.has(ingredient):
			$"../PotionMessage".message = "Not enough ingredients to make " + potionName + " potion"
			$"../PotionMessage".visible = true
			return
			
		$"../PotionMessage".message = "Successfully created " + potionName + " potion"
		$"../PotionMessage".visible = true
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
	global.selectedPotion = ""

func _on_pressed():
	print("presed create") # Replace with function body.
	check_if_can_make(global.selectedPotion)
