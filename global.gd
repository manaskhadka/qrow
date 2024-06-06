extends Node

var player_current_attack = false
var items = {}

var returnPosition: Vector2;
var camPosition: Vector2;

# index  0 = amount and index 1 = texture to load
var recipes = {"healing": {"apple": [1,"res://graphics/Pixel Potions/2-removebg-preview.png"]}}
