extends Node2D

signal died

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer
var hp = 25 setget set_hp


func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp) + "hp"
	if hp <= 0:
		emit_signal("died")
		queue_free()
	else:
		animationPlayer.play("Shake")
		yield(animationPlayer, "animation_finished")
		animationPlayer.play("Attack")
