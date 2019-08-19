extends "res://ActionButton.gd"

const Slash = preload("res://scenes/Slash.tscn")

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func _on_pressed() -> void:
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	
	if enemy != null and playerStats != null:
		create_slash(enemy.global_position)
		# change 1: dynamic damage instead of 4.
		var damage = clamp(rng.randi_range(0, 4), 0, 4)
		enemy.take_damage(damage)
		playerStats.ap -= 1
		playerStats.mp += 2

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position