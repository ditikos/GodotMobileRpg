extends Node

var max_hp = 25
var hp = max_hp setget set_hp
var max_ap = 3
var ap = max_ap setget set_ap
var max_mp = 10
var mp = max_mp setget set_mp

signal end_turn

func set_hp(value):
	hp = value
	
func set_ap(value):
	ap = value
	
func set_mp(value):
	mp = value