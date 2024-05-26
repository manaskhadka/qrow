extends Area2D
var entered = false


func _on_body_entered(body):
	entered = true # Replace with function body.


func _on_body_exited(body):
	entered = false # Replace with function body.

func _process(delta):
	if entered == true:
		print("trying to talk to witch")
		print(	find_child("Witch"))
		print(find_child("Witch").material.get_shader_parameter("outline_enabled"))
		find_child("Witch").material.set_shader_parameter("outline_enabled", true)
		print(find_child("Witch").material.get_shader_parameter("outline_enabled"))
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world4.tscn")
