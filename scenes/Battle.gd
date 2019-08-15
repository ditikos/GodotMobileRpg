extends Node

onready var enemy = $Enemy
onready var swordButton = $UI/GridContainer/SwordButton

func _on_SwordButton_pressed():
	if enemy != null:
		enemy.hp -= 4


func _on_Enemy_died():
	swordButton.hide()
	enemy = null