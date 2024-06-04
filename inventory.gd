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
			
		if is_open:
			close()
		else:
			open()
