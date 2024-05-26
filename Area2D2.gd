extends Area2D
var entered = false


func _on_body_entered(body):
	entered = true # Replace with function body.


func _on_body_exited(body):
	entered = false # Replace with function body.
	find_child("Witch").material.set_shader_parameter("outline_enabled", false)

func _process(delta):
	if entered == true:
		find_child("Witch").material.set_shader_parameter("outline_enabled", true)
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world4.tscn")
