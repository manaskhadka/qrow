extends CanvasLayer

@export_file("*.json") var dialogue_file

var dialogue = []
var curr_dialogue_id = 0
var d_active = false

func _ready():
	$NinePatchRect.visible = false


func start():
	if d_active:
		# We've already started; do nothing
		return 
		
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue() 
	var crow = get_node("NinePatchRect/CrowPortrait")
	var witch = get_node("NinePatchRect/WitchPortrait")
	crow.visible=false
	witch.visible=false
	
	if dialogue[0]['name'] == "Witch":
		witch.visible=true
	elif dialogue[0]['name'] == "Crow":
		crow.visible=true
	
	curr_dialogue_id = -1
	next_script()

func load_dialogue():
	var json_string = FileAccess.get_file_as_string(dialogue_file)
	print("Accessing", dialogue_file)
	var json_dict = JSON.parse_string(json_string)
	print("LOADED TEXT:")
	print(json_string)
	print("\n")
	return json_dict
	
func _input(event):
	if not d_active:
		return 
		
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	curr_dialogue_id += 1
	
	# We have reached the end of the dialogue
	if curr_dialogue_id >= len(dialogue):
		$Timer.start()
		$NinePatchRect.visible = false
		return
		
	$NinePatchRect/Name.text = dialogue[curr_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[curr_dialogue_id]['text']
	
func _on_timer_timeout():
	d_active = false
