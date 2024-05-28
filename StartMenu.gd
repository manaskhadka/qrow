extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_start_button_pressed():
	#change scene to initial tutorial scene after we make it
	get_tree().change_scene_to_file("res://world.tscn")
	
	


func _on_quit_button_pressed():
	get_tree().quit()
