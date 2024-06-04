extends Button
@export var potionName: String;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = potionName
	
func check_if_can_make(potionName: String):
	for ingredient in global.recipes[potionName]:
		if !global.items.has(ingredient):
			print("not enough to make potion, sorry")
			return
		print("yay you can make the potion")
		global.items[ingredient].amount -= 1
		if global.items[ingredient].amount == 0:
			global.items.erase(ingredient)
		
	

func _on_pressed():
	print("you pressed a potion type") # Replace with function body.
	print("potion name", potionName)
	print("potion ingredients", global.recipes[potionName])
	check_if_can_make(potionName)
	
