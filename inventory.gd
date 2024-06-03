extends Node2D
var is_open = false
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	close() # Replace with function body.
	
func open():
	self.visible = true
	is_open = true
	
func close():
	visible = false
	is_open = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("i"):
		print("just pressed i")
		var min = min(global.items.size(), slots.size())
		print("min:", min)
		
		for i in range(min):
			print("slots at i:", slots[i])
			print("global items:", global.items)
			print("specific global item texture:", global.items[i].texture)
			print("specific global item amount:", global.items[i].amount)
			slots[i].update(global.items[i])
			
		if is_open:
			close()
		else:
			open()
