extends CharacterBody2D

var gravity = 15
var speed = 50
var jump_power = 380
var moving = false


func _physics_process(delta):
	apply_animation()
	velocity.x = 0
	moving = false
	velocity.y += gravity
	
	if Input.is_action_pressed("right"):
		velocity.x += speed
		moving = true
		$AnimatedSprite2D.scale.x = 1
	if Input.is_action_pressed("left"):
		velocity.x += -speed	
		moving = true
		$AnimatedSprite2D.scale.x = -1
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y += -jump_power
			$Jump.play()
	
		if Input.is_action_just_pressed("shoot"):
			$Shoot.play()
			var bullet = preload("res://Player/sence/bullet.tscn").instantiate()
			bullet.global_position = $AnimatedSprite2D/Marker2D.global_position
			bullet.dir = $AnimatedSprite2D.scale.x
			get_tree().root.add_child(bullet)
		
	if Global.score < 10:
		$Control/PlayerUI/Score.text = '0' + str(Global.score)
	else:
		$Control/PlayerUI/Score.text = str(Global.score)
   
	move_and_slide()


func apply_animation():
	if is_on_floor():
		if moving == true:
			$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("jump")
		
func damage():
	$Control/PlayerUI/HealthBar.value -= 1
	$Hurt.play()
	
	if $Control/PlayerUI/HealthBar.value == 0:
		Transition.die()
	
	


func _on_damage_area_body_entered(body):
	if body.is_in_group("Enemy"):
		damage()
		
