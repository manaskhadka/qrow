extends Node

var player_current_attack = false
var items = {}

var returnPosition: Vector2;
var camPosition: Vector2;

# index  0 = amount and index 1 = texture to load
var recipes = {"death": {"apple": [2,"res://graphics/Pixel Potions/2-removebg-preview.png"], "green":[2,"res://graphics/Pixel Potions/9-removebg-preview.png"]}, "healing": {"apple": [2,"res://graphics/Pixel Potions/2-removebg-preview.png"]}}

# saves selected potion in inventory
var selectedPotion: String = ""

# lets you know which inventory to show
var hideRegularInventory: bool = false

# stores created potions and how many you have made
var createdPotions = {}
