extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = get_node("Crow").get_node("Dialogue")
	dialogue.dialogue_file = "res://dialogues/beginning2.json"
	dialogue.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
