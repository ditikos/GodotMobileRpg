extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

signal died
signal end_turn

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer
export (int)var hp = 25 setget set_hp
export (int)var damage = 4

# new way
func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp) + "hp"

func deal_damage():
	BattleUnits.PlayerStats.hp -= damage
	# print("damage dealt!")

func attack() -> void:
	yield(get_tree().create_timer(0.4),"timeout")
	animationPlayer.play("Attack")
	yield(animationPlayer, "animation_finished")
	emit_signal("end_turn")

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animationPlayer.play("Shake")
	
func is_dead():
	return hp <= 0
	
func _ready() -> void:
	BattleUnits.Enemy = self
	
func _exit_tree() -> void:
	BattleUnits.Enemy = null




