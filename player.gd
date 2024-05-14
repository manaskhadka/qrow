extends CharacterBody2D


@export var decel_coeff: float = .88
@export var speed: float = 10
@export var max_speed: float = 100

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D	

func _physics_process(delta) -> void:
	if Input.is_action_pressed("up"):
		if (velocity.y >= -1*max_speed):
			velocity.y -= speed
	if Input.is_action_pressed("down"):
		if (velocity.y <= max_speed):
			velocity.y += speed
	if Input.is_action_pressed("left"):
		if (velocity.x >= -1*max_speed):
			velocity.x -= speed
	if Input.is_action_pressed("right"):
		if (velocity.x <= max_speed):
			velocity.x += speed
	
	velocity.y *= decel_coeff
	velocity.x *= decel_coeff
	
	move_and_slide()

