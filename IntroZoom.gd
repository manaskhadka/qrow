extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = get_node("Crow").get_node("Dialogue")
	dialogue.dialogue_file = "res://dialogues/beginning.json"
	dialogue.start()
	pass # Replace with function body.

func _input(event): 
	if event.is_action_pressed("ui_accept"): 
		get_tree().change_scene_to_file("res://IntroForest.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if (soemthing pressed space bar): 
		#then change scene
		pass
