# Base character class for D&D 5e RPG
# Implements core stats and mechanics

extends Node

# D&D 5e Ability Scores
@export var strength: int = 10
@export var dexterity: int = 10
@export var constitution: int = 10
@export var intelligence: int = 10
@export var wisdom: int = 10
@export var charisma: int = 10

# Combat stats
@export var hit_points: int = 10
@export var max_hit_points: int = 10
@export var armor_class: int = 10
@export var proficiency_bonus: int = 2
@export var hit_dice: int = 1  # Number of hit dice (e.g., d10 for fighter)
@export var hit_dice_type: int = 10  # Hit die type (d4, d6, d8, d10, d12)

# Character state
var is_alive: bool = true
var can_act: bool = true

func _ready():
	recalculate_stats()

func _int(value: int) -> int:
	# D&D 5e ability score modifier calculation
	# modifier = (score - 10) / 2, rounded down
	return int((value - 10) / 2)

func get_modifier(stat: int) -> int:
	return _int(stat)

func recalculate_stats():
	# Recalculate derived stats based on ability scores
	# AC = 10 + DEX modifier (unarmored)
	armor_class = 10 + get_modifier(dexterity)
	max_hit_points = constitution + (hit_dice * hit_dice_type) + (get_modifier(constitution) * hit_dice)

func take_damage(amount: int):
	hit_points = max(0, hit_points - amount)
	if hit_points == 0:
		is_alive = false
		can_act = false

func heal(amount: int):
	if is_alive:
		hit_points = min(max_hit_points, hit_points + amount)

func roll_d20() -> int:
	# Roll a 20-sided die
	return randi_range(1, 20)

func attack_roll() -> int:
	# Attack roll: d20 + proficiency bonus + STR/DEX modifier
	var ability_mod = get_modifier(strength)  # For melee attacks
	return roll_d20() + proficiency_bonus + ability_mod

func skill_check(skill: String, advantage: bool = false, disadvantage: bool = false) -> int:
	# Skill check with advantage/disadvantage rules
	var roll = roll_d20()
	var mod = get_modifier(get_stat_for_skill(skill))

	if advantage and disadvantage:
		# Cancel out
		return roll + mod
	elif advantage:
		var roll2 = roll_d20()
		return max(roll, roll2) + mod
	elif disadvantage:
		var roll2 = roll_d20()
		return min(roll, roll2) + mod
	else:
		return roll + mod

func get_stat_for_skill(skill: String) -> int:
	# Map skills to ability scores
	match skill:
		"acrobatics", "stealth", "survival": return dexterity
		"athletics": return strength
		"arcana", "history", "investigation", "nature", "religion": return intelligence
		"animal_handling", "insight", "medicine", "perception", "survival": return wisdom
		"deception", "intimidation", "performance", "persuasion": return charisma
	return 10  # Default no modifier
