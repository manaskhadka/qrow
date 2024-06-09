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
	# CANNOT MAKE THE POTION
	if potionName == "":
			$"../PotionMessage".message = "You must first choose a potion to create it"
			$"../PotionMessage".visible = true
			return
		
	for ingredient in global.recipes[potionName].keys():
		if !global.items.has(ingredient):
			$"../PotionMessage".message = "Not enough ingredients to make " + potionName + " potion"
			$"../PotionMessage".visible = true
			return
		
		if global.recipes[potionName][ingredient][0] > global.items[ingredient].amount:
			$"../PotionMessage".message = "Not enough ingredients to make " + potionName + " potion"
			$"../PotionMessage".visible = true
			return
			
	# CAN AND DO MAKE THE POTION	
	for ingredient in global.recipes[potionName].keys():	
		
		# Add to dictionary for created potions
		if !global.createdPotions.has(potionName):
			global.createdPotions[potionName] = 0
		global.createdPotions[potionName] += 1	
		
		# Handle message to users that potion has been created
		$"../PotionMessage".message = "Successfully created " + potionName + " potion"
		$"../PotionMessage".visible = true
		
		# Reduce amount of available ingredients
		global.items[ingredient].amount -= global.recipes[potionName][ingredient][0]
		if global.items[ingredient].amount == 0:
			global.items.erase(ingredient)
			
	# Add the created potion symbol to inventory
	if !global.items.has(potionName):
		var inventory_slot = InventorySlot.new()
		inventory_slot.texture = load(global.potionIcons[potionName])
		inventory_slot.amount = 1
		global.items[potionName] = inventory_slot
	else:
		global.items[potionName].amount += 1
	
	# Update ingredients displayed in inventory
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
	
	# check if you just made the healing potion
	if global.selectedPotion == "healing" and global.truthFound == true:
		get_tree().change_scene_to_file("res://decision.tscn")
		
	# clear selected potion value
	global.selectedPotion = ""

func _on_pressed():
	print("presed create") # Replace with function body.
	check_if_can_make(global.selectedPotion)
	print("CREATED POTIONS", global.createdPotions)
