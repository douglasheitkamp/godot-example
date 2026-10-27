# Combat system manager
# Handles turn-based combat flow

extends Node

# Combat state
var turn_order: Array = []
var current_turn_index: int = 0
var combat_round: int = 1
var is_combat_active: bool = false

# Actor data structure
class CombatActor:
	var name: String
	var character: Node
	var initiative: int
	var is_player: bool

func _ready():
	pass

func start_combat(player_character: Node, enemies: Array) -> void:
	is_combat_active = true
	combat_round = 1
	current_turn_index = 0

	# Roll initiative for all combatants
	turn_order = []

	# Player initiative
	var player_actor = CombatActor.new()
	player_actor.name = "Player"
	player_actor.character = player_character
	var dex_mod = int((player_character.dexterity - 10) / 2)
	player_actor.initiative = player_character.roll_d20() + dex_mod
	player_actor.is_player = true
	turn_order.append(player_actor)

	# Enemy initiatives
	for enemy in enemies:
		var enemy_actor = CombatActor.new()
		enemy_actor.name = enemy.name if enemy.has("name") else "Enemy"
		enemy_actor.character = enemy
		enemy_actor.initiative = enemy.roll_d20() if enemy.has_method("roll_d20") else randi_range(1, 20)
		enemy_actor.is_player = false
		turn_order.append(enemy_actor)

	# Sort by initiative (descending)
	turn_order.sort_custom(self, "sort_initiative")

	var names = []
	for actor in turn_order:
		names.append(actor.name)
	print("Combat started! Turn order: " + str(names))

func sort_initiative(a: CombatActor, b: CombatActor) -> bool:
	return a.initiative > b.initiative

func get_current_actor() -> CombatActor:
	if turn_order.size() > 0:
		return turn_order[current_turn_index]
	return null

func next_turn() -> void:
	current_turn_index = (current_turn_index + 1) % turn_order.size()
	if current_turn_index == 0:
		combat_round += 1
	var actor = get_current_actor()
	print("Round " + str(combat_round) + ", turn: " + actor.name)

func end_combat(won: bool) -> void:
	is_combat_active = false
	var result = "Won" if won else "Lost"
	print("Combat ended! Result: " + result)
	# Return to exploration
	get_tree().change_scene_to_file("res://scenes/world.tscn")
