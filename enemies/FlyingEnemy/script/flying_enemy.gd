extends CharacterBody2D

@export var speed = 3
var time = 0 
var start_y_position 


func _ready():
	start_y_position = position.y
	$AnimatedSprite2D.play("fly")
	
func _physics_process(delta):
	time += delta
	position.y = start_y_position + get_sin()
	
func get_sin():
	return sin(time * speed) * 10
