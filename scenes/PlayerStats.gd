extends Node

const BattleUnits = preload("res://BattleUnits.tres")

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal rm_changed(value)

var max_hp = 25
var hp = max_hp setget set_hp
var max_ap = 3
var ap = max_ap setget set_ap
var max_mp = 10
var mp = max_mp setget set_mp
var max_rm = 10
var rm = 1 setget set_rm

signal end_turn

func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed",hp)
	
func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed",ap)
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed",mp)
	
func set_rm(value):
	rm = clamp(value, 0, max_rm)
	emit_signal("rm_changed",rm)
	
func _ready() -> void:
	BattleUnits.PlayerStats = self
	
func _exit_tree() -> void:
	BattleUnits.PlayerStats = null