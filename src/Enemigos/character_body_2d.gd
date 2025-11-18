extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_force: float = -300.0
@export var gravity: float = 600.0
@export var attack_range: float = 50.0

var player: Node2D = null
var vel: Vector2 = Vector2.ZERO  # renamed from velocity

func _ready():
	# Find the player in the scene tree
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if not player:
		return
	
	# Apply gravity
	if not is_on_floor():
		vel.y += gravity * delta
	else:
		vel.y = 0  # reset when grounded
	
	# Move toward player
	var dir = sign(player.global_position.x - global_position.x)
	vel.x = dir * speed
	
	# Jump if player is above and close
	if player.global_position.y < global_position.y - 10 and is_on_floor():
		vel.y = jump_force
	
	# Simple attack check
	if global_position.distance_to(player.global_position) < attack_range:
		attack()

	velocity = vel  # use CharacterBody2D's built-in velocity
	move_and_slide()

func attack():
	print("Enemy attacks!")
