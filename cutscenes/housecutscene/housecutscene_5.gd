extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().change_scene_to_file("res://world.tscn")
	if Input.is_action_pressed("left"):
		get_tree().change_scene_to_file("res://cutscenes/housecutscene/housecutscene_4.tscn")
