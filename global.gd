extends Node

var player_current_attack = false
var items = {}

# These control access points for the crow
# i.e. the crow cannot access certain locations unless true
var darkforestavailable = false
var darkforestdefeated = false
var witchGone = false

var returnPosition: Vector2;
var camPosition: Vector2;

# index  0 = amount and index 1 = texture to load
var recipes = {"death": {"apple": [2,"res://graphics/Pixel Potions/2-removebg-preview.png"]},
			  "healing": {"apple": [2,"res://graphics/Pixel Potions/2-removebg-preview.png"], "berry": [3,"res://graphics/Deep Forest/Foliage/Fruit+.png"], "crystal": [1,"res://Crystals.png"]}}

# saves selected potion in inventory
var selectedPotion: String = ""

# lets you know which inventory to show
var hideRegularInventory: bool = false

# stores created potions and how many you have made
var createdPotions = {}

# checks whether the fight scene is done
var fightDone: bool = true

# checks if crow has discovered the truth yet
var truthFound: bool = false

#stores associated symbols
var potionIcons = {"healing": "res://dialogues/Pixel Heart Sprite Sheet 32x32.png", "death":"res://Skull&Bones - FrodoUndead.png" }
