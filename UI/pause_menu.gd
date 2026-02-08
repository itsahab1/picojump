extends Control

func _physics_process(delta):
	if Input.is_action_just_pressed("Pause") and get_tree().current_scene.is_in_group("Level"):
		start()

func start():
	get_tree().paused = true
	$CanvasLayer.show()

func _on_resume_pressed():
	get_tree().paused = false
	$CanvasLayer.hide()
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().paused = false
	$CanvasLayer.hide()
	Transition.changed_scene("res://UI/menu.tscn")
	pass # Replace with function body.
