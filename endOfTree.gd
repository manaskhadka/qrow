extends Area2D
var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = false
	pass # Replace with function body.
	
func _input(event): 
	if entered == true and event.is_action_pressed("ui_accept") and len(get_overlapping_areas()) > 0: 
		get_tree().change_scene_to_file("res://IntroForest.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false# Replace with function body.
