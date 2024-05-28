extends Area2D
var entered = false
@export var image : String = "res://graphics/Top-Down Retro Interior/Shelf.png"

func _ready():
	$object.texture = load(image)
		
func _on_body_entered(body):
	entered = true # Replace with function body.
	
func _on_body_exited(body):
	entered = false # Replace with function body.
	find_child("object").material.set_shader_parameter("outline_enabled", false)

func _process(delta):
	if entered == true:
		find_child("object").material.set_shader_parameter("outline_enabled", true)
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://world4.tscn")
