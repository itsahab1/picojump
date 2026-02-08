extends Control


func _on_start_pressed():
	Transition.changed_scene("res://world/Level/level_1.tscn")

func _on_exit_pressed():
	get_tree().quit()
