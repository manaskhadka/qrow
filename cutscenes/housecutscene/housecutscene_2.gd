extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().change_scene_to_file("res://cutscenes/housecutscene/housecutscene_3.tscn")
	if Input.is_action_pressed("left"):
		get_tree().change_scene_to_file("res://cutscenes/housecutscene/housecustscene_1.tscn")
		

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
