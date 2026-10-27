# Player controller script
# Handles movement, input, and exploration

extends CharacterBody2D

# Movement settings
@export var move_speed: float = 200.0
@export var grid_size: int = 32  # Pixel size of grid tiles

# State
var is_in_combat: bool = false
var current_tile: Vector2 = Vector2.ZERO

func _ready():
	# Start at center of screen
	position = Vector2(400, 300)
	current_tile = get_tile_position()

func _physics_process(delta):
	if is_in_combat:
		velocity = Vector2.ZERO
		return

	# Get input
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1

	# Normalize and apply speed
	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
		velocity = input_dir * move_speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	# Update tile position
	var new_tile = get_tile_position()
	if new_tile != current_tile:
		current_tile = new_tile
		check_encounter()

func get_tile_position() -> Vector2:
	return Vector2(int(position.x / grid_size), int(position.y / grid_size))

func check_encounter():
	# Check for random encounter based on location
	# Different tiles have different encounter rates
	var encounter_chance = get_encounter_chance(current_tile)
	if randf() < encounter_chance:
		start_combat()

func get_encounter_chance(tile: Vector2) -> float:
	# Different areas have different encounter rates
	# For prototype: 15% chance per tile transition
	return 0.15

func start_combat():
	is_in_combat = true
	print("Encounter started!")
	# Transition to combat scene
	get_tree().change_scene_to_file("res://scenes/combat.tscn")
