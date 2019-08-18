extends Control

export (String, MULTILINE) var description = ""

func _on_HoverInfo_mouse_entered() -> void:
	var main = get_tree().current_scene
	var battleMessage = main.find_node("BattleMessage")
	if battleMessage != null:
		battleMessage.text = description


func _on_HoverInfo_mouse_exited() -> void:
	var main = get_tree().current_scene
	var battleMessage = main.find_node("BattleMessage")
	if battleMessage != null:
		battleMessage.text = ""