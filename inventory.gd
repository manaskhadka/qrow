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
		print("minimum size")
		var min = min(global.items.size(), slots.size())
		print(min)
		print("i")
		for i in range(min):
			print("slot")
			print(slots[i])
			slots[i].update(global.items[i])
			
		if is_open:
			close()
		else:
			open()
