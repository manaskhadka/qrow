extends Area2D
var entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.returnPosition = Vector2(542, 152)
			get_tree().change_scene_to_file("res://world.tscn")
			
			#global.returnPosition =  $"../Crow".position
	
func _on_body_entered(body: PhysicsBody2D):
	entered = true # Replace with function body

func _on_body_exited(body):
	entered = false # Replace with function body.
		
