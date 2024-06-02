extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel2/item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update(item2: Texture2D):
	print("update was called")
	if !item2:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		$CenterContainer/Panel2/itemLabelabel.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		$CenterContainer/Panel2/itemLabel.visible = true
		$CenterContainer/Panel2/itemLabel.text = "1"
		print("show image")
		$CenterContainer/Panel2/item.texture = item2
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
