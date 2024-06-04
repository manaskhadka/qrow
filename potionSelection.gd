extends Button
@export var potionName: String;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = potionName
	
func _check_if_can_make(potionName: String):
	for i in range(global.items.size()):
		# need to check if we have all of the necessary ingredients
		pass 
	

func _on_pressed():
	print("you pressed a potion type") # Replace with function body.
	print("potion name", potionName)
	print("potion ingredients", global.recipes[potionName])
	
