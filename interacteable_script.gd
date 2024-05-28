extends Area2D
var entered = false
@export var image : Texture

func _ready():
	$object.texture = preload("res://5.png")
		
func _on_body_entered(body):
	entered = true # Replace with function body.
	print("I am close")

func _on_body_exited(body):
	entered = false # Replace with function body.
	print(find_child("object").material.get_shader_parameter("outline_enabled"))
	find_child("object").material.set_shader_parameter("outline_enabled", false)
	print(find_child("object").material.get_shader_parameter("outline_enabled"))

func _process(delta):
	if entered == true:
		find_child("object").material.set_shader_parameter("outline_enabled", true)
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world4.tscn")
