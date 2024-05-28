extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($TextureRect/c.text == "c" and $TextureRect/e.text == "e" and $TextureRect/d.text == "d" and $TextureRect/r.text == "r" and $TextureRect/i.text == "i" and $TextureRect/c2.text == "c"):
		print("password guessed")
