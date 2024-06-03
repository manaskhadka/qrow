extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel2/item
@onready var itemLabel: Label = $CenterContainer/Panel2/itemLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update(item2: InventorySlot):
	print("update was called")
	if !item2:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		itemLabel.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemLabel.visible = true
		itemLabel.text = str(item2.amount)
		itemSprite.texture = item2.texture
		var size = $CenterContainer.size
		var height = itemSprite.texture.get_height()
		var scale = (size[0] - 5) / height
		itemSprite.scale = Vector2(scale, scale)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
