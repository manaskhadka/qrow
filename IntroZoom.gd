extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print($Label.visible)
	$Label.visible = false
	print($Label.visible)
	var dialogue = get_node("Crow").get_node("Dialogue")
	dialogue.dialogue_file = "res://dialogues/beginning.json"
	dialogue.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if (soemthing pressed space bar): 
		#then change scene
		pass
