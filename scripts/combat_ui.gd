# Combat UI controller
# Handles HUD and combat menu

extends Control

# Combat state
var player_character: Node = null
var current_enemy: Node = null
var is_player_turn: bool = false

func _ready():
	hide()

func show_combat(player: Node, enemy: Node):
	player_character = player
	current_enemy = enemy
	is_player_turn = true

	# Show UI
	show()

	update_message("Your turn! Choose an action.")

func update_message(msg: String):
	print(msg)

func _on_attack_button_pressed():
	if not is_player_turn or not player_character or not current_enemy:
		return

	# Player attacks
	var result = player_character.attack(current_enemy)

	if result.hit:
		var crit_text = " (CRITICAL!)" if result.critical else ""
		update_message("You hit for " + str(result.damage) + " damage!" + crit_text)
	else:
		update_message("You missed!")

	if not current_enemy.is_alive:
		get_tree().call_group("combat", "end_combat", true)
		return

	is_player_turn = false
	# Enemy turn will be handled by combat manager
