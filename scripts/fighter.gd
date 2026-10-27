# Fighter class implementation
# Extends base character with fighter-specific features

extends "res://scripts/character.gd"

# Fighter class features
@export var fighter_level: int = 1
@export var fighting_style: String = "defense"  # defense, dueling, great weapon, protection
@export var second_wind: bool = true
@export var second_wind_available: bool = true
@export var action_surge: bool = true
@export var action_surge_available: bool = true

# Fighter features by level
var martial_arts: bool = true
var indomitable: bool = false
var extra_attack: bool = false

func _ready():
	super._ready()
	apply_fighter_features()

func apply_fighter_features():
	# Apply class features based on level
	if fighter_level >= 2:
		second_wind = true
	if fighter_level >= 3:
		extra_attack = true
	if fighter_level >= 5:
		indomitable = true

func get_hit_dice_type() -> int:
	return 10  # Fighter uses d10 hit dice

func use_second_wind():
	if second_wind_available and hit_points > 0:
		# Recover 1d10 + fighter level HP
		var recovery = randi_range(1, hit_dice_type) + fighter_level
		heal(recovery)
		second_wind_available = false

func use_action_surge():
	if action_surge_available:
		action_surge_available = false
		return true
	return false

func attack(target: Node) -> Dictionary:
	# Fighter attack action
	var result = {
		"hit": false,
		"damage": 0,
		"critical": false
	}

	var attack_roll = self.attack_roll()
	var target_ac = target.get("armor_class", 10)

	if attack_roll >= target_ac:
		result.hit = true
		# Weapon damage (longsword: 1d8 + STR)
		var base_damage = randi_range(1, 8)
		var str_mod = get_modifier(strength)
		var damage = base_damage + str_mod

		# Critical hit on natural 20
		if attack_roll == 20:
			result.critical = true
			damage *= 2

		result.damage = damage
		target.take_damage(damage)

	return result
