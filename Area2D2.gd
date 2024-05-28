extends Area2D
var entered = false


func _on_body_entered(body):
	entered = true # Replace with function body.
	print("entered witch")


func _on_body_exited(body):
	entered = false # Replace with function body.
	find_child("Witch").material.set_shader_parameter("outline_enabled", false)

func _process(delta):
	if entered == true:
		find_child("Witch").material.set_shader_parameter("outline_enabled", true)
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world4.tscn")

func _input(event):
	if event.is_action_pressed("attack") and len(get_overlapping_bodies()) > 0:
		use_dialogue() 
		
func use_dialogue():
	var dialogue = get_parent().get_node("Crow").get_node("Dialogue")
	
	if dialogue:
		dialogue.start()
