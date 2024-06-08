extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#extends Node2D

func _input(event): 
	if event.is_action_pressed("ui_accept"): 
		if len(get_overlapping_areas()) > 0:
			get_tree().change_scene_to_file("res://outside.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if (soemthing pressed space bar): 
		#then change scene
		pass
