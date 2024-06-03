extends CharacterBody2D

const SPEED = 30
@export var player: CharacterBody2D
var randomnum

enum {
	SURROUND,
	ATTACK,
	HIT
}
var state = SURROUND

func _ready():
	velocity = Vector2.ZERO	
	var rng = RandomNumberGenerator.new()
	rng.randomize() 
	randomnum = rng.randf()

func _physics_process(delta):
	match state:
		SURROUND:
			move(get_circle_position(randomnum), delta)
		
func move(target, delta):
	var direction = (target - global_position).normalized() 
	var desired_velocity = direction * SPEED
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()

func get_circle_position(random):
	var kill_circle_centre = player.global_position
	var radius = 40 # Change as needed
	var angle = random * PI * 2
	var x = kill_circle_centre.x + cos(angle) * radius
	var y = kill_circle_centre.y + sin(angle) * radius 
	return Vector2(x, y)

