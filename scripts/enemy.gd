# Enemy script for combat

extends Node

@export var enemy_name: String = "Goblin"
@export var hit_points: int = 10
@export var max_hit_points: int = 10
@export var armor_class: int = 12
@export var attack_bonus: int = 3
@export var damage_dice: int = 6

var is_alive: bool = true

func take_damage(amount: int):
	hit_points = max(0, hit_points - amount)
	if hit_points == 0:
		is_alive = false

func roll_d20() -> int:
	return randi_range(1, 20)

func attack() -> int:
	var damage = randi_range(1, damage_dice)
	return damage
