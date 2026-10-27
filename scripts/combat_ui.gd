# Combat UI controller
# Handles HUD and combat menu

extends Control

# UI Elements
@onready var health_bar: ProgressBar = $HealthBar
@onready var enemy_health_bar: ProgressBar = $EnemyHealthBar
@onready var combat_menu: Control = $CombatMenu
@onready var action_buttons: Control = $CombatMenu/ActionButtons
@onready var message_label: Label = $MessageLabel

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

	# Update health bars
	update_health_bars()
	update_message("Your turn! Choose an action.")

func update_health_bars():
	if player_character:
		health_bar.value = player_character.hit_points
		health_bar.max_value = player_character.max_hit_points

	if current_enemy:
		enemy_health_bar.value = current_enemy.hit_points
		enemy_health_bar.max_value = current_enemy.max_hit_points

func update_message(msg: String):
	message_label.text = msg

func _on_attack_button_pressed():
	if not is_player_turn or not player_character or not current_enemy:
		return

	# Player attacks
	var result = player_character.attack(current_enemy)

	if result.hit:
		var crit_text = " (CRITICAL!)" if result.critical else ""
		update_message("You hit for %d damage!%s" % [result.damage, crit_text])
	else:
		update_message("You missed!")

	update_health_bars()

	if not current_enemy.is_alive:
		get_tree().call_group("combat", "end_combat", true)
		return

	is_player_turn = false
	# Enemy turn will be handled by combat manager
