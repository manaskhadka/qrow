extends CharacterBody2D

@export var slow_coeff = 300
@export var player_chase = false

var speed = 100
var player = null
var original_pos

var max_health = 500
var curr_health = max_health
var player_inattack_zone = false
var health_bar: TextureProgressBar


func _ready():
	original_pos = self.position
	health_bar = get_node("TextureProgressBar")
	health_bar.max_value = max_health
	health_bar.value = curr_health
	
func _physics_process(delta):
	process_damage()
	if player_chase:
		move(player.position, delta)
	else:
		position += (original_pos - self.position) / slow_coeff
	# health_bar.position = Vector2(self.position.x, self.position.y - 20)
	
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
		curr_health = curr_health - 20  
		print("enemy health:", curr_health)
		update_health_bar()
		if curr_health <= 0:
			self.queue_free()
			
func move(target, delta):
	var direction = (target - global_position).normalized() 
	var desired_velocity = direction * speed
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()
	
func update_health_bar():
	health_bar.value = curr_health
	
