extends Area2D
func _on_body_entered(body):
	if body.is_in_group("Player"):
		Transition.changed_scene("res://world/Level/level_" + str(get_tree().current_scene.name.to_int() + 1) + ".tscn")
