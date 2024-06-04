extends CharacterBody2D

@export var decel_coeff: float = .92
@export var speed: float = 15
@export var max_speed: float = 150
var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var curr_direction = "right"
var is_attacking = false

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D	

func _physics_process(delta) -> void:
	attack()
	movement()
	enemy_attack()
	if health <= 0:
		print("player has died")
		health = 100

func movement():
	if Input.is_action_pressed("up"):
		curr_direction = "up"
		if (velocity.y >= -1*max_speed):
			velocity.y -= speed
	if Input.is_action_pressed("down"):
		curr_direction = "down"
		if (velocity.y <= max_speed):
			velocity.y += speed
	if Input.is_action_pressed("left"):
		curr_direction = "left"
		if (velocity.x >= -1*max_speed):
			velocity.x -= speed
		anim_sprite.play("flying left")
	if Input.is_action_pressed("right"):
		curr_direction = "right"
		if (velocity.x <= max_speed):
			velocity.x += speed
		anim_sprite.play("flying right")
	
	velocity.y *= decel_coeff
	velocity.x *= decel_coeff
	
	move_and_slide()
	
func attack():
	var dir = curr_direction 
	
	if Input.is_action_pressed("attack"):
		if is_attacking == false:
			global.player_current_attack = true
			is_attacking = true
			if curr_direction == "right":
				# handle animations
				pass 
			if curr_direction == "left":
				# handle animations
				pass
			$"attack-cooldown".start()
	
func player():
	pass
	
func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"): 
		enemy_in_attack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false
		
func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown:
		enemy_attack_cooldown = false
		$"invincibility-cooldown".start()
		health -= 10
		print("Health:", health)

func _on_invincibilitycooldown_timeout():
	# This gets called whenever the invincibility timer goes off
	enemy_attack_cooldown = true

func _on_attackcooldown_timeout():
	print("Player attacked!")
	$"attack-cooldown".stop()
	global.player_current_attack = false 
	is_attacking = false

func _ready():
	#$AnimatedSprite2D.position = Vector2(100,-100)
	if global.returnPosition != Vector2(0,0):
		$".".global_position = global.returnPosition
		$Camera2D.global_position = global.returnPosition
		global.returnPosition = Vector2(0,0)

