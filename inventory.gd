extends Node2D
var is_open = false


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
		print("i")
		if is_open:
			close()
		else:
			open()
