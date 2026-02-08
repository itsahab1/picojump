extends CharacterBody2D

var gravity = 10
var speed = 30
var is_moving_right = true

func _ready():
	$AnimatedSprite2D.play("walk")

func _physics_process(delta):
	detect_turn_around()
	# تأثير الجاذبية
	velocity.y += gravity
	
	# الحركة يمين ويسار
	if is_moving_right == true:
		velocity.x = speed
	else:
		velocity.x = -speed

	move_and_slide()
	
	
func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_right = !is_moving_right
		scale.x = -scale.x   #عكس اتجاه العدو
