extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func changed_scene(path, deley = 0.1):
	get_tree().paused = true
	await get_tree().create_timer(deley).timeout
	animation_player.play("in")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(path)
	animation_player.play("out")
	get_tree().paused = false
	
func die(deley = 0.01):
	get_tree().paused = true
	await get_tree().create_timer(deley).timeout
	animation_player.play("in")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play("out")
	get_tree().paused = false
