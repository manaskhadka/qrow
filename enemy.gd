extends CharacterBody2D

@export var slow_coeff = 30
@export var player_chase = false
var player = null
var original_pos

var health = 500
var player_inattack_zone = false


func _ready():
	original_pos = self.position
	
func _physics_process(delta):
	process_damage()
	if player_chase:
		position += (player.position - self.position) / slow_coeff
	else:
		position += (original_pos - self.position) / slow_coeff
		
	
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false  
		
func process_damage():
	if player_inattack_zone and global.player_current_attack:
		health = health - 20  
		print("enemy health:", health)
		if health <= 0:
			self.queue_free()
	
