extends Button
@export var scene : String = "res://world.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("hi")
	get_tree().change_scene_to_file(scene)


func _on_area_2d_mouse_entered():
	pass # Replace with function body.
