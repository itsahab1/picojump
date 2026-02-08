extends Area2D

var speed = 4
var dir = 1   # 1 لليمين، -1 لليسار

func _ready():
	pass
	
func _physics_process(delta):
	# حركة الرصاصة	
	position += Vector2(speed * dir, 0)
	
	# ضبط اتجاه الصورة حسب الحركة
	if dir == 1:
		$sprite.flip_h = false
	else:
		$sprite.flip_h = true
	
	await  get_tree().create_timer(5).timeout
	queue_free()


func _on_body_entered(body):
	
	if body.is_in_group("Enemy"):
		body.queue_free()
		
	BulletHit.play()
	queue_free()
