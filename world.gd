extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.witchGone and $Witch2:
		$Witch2.queue_free()
	if global.darkforestdefeated:
		print("Dark forest defeated, new dialogue")
		$Witch2.dialogue_file = "res://dialogues/witch-injured.json"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.witchGone and $Witch2:
		$Witch2.queue_free()

