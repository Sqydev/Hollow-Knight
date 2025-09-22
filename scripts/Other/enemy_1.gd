extends Area2D

@onready var the_knight: CharacterBody2D = $"."
@onready var ray_left: RayCast2D = $Ray_left
@onready var ray_right: RayCast2D = $Ray_right

var direction = 0
var speed = 100

func _physics_process(delta: float) -> void:
	if the_knight.position.x > position.x:
		direction = 1
	elif the_knight.position.x < position.x:
		direction = -1
	else: 
		direction = 0
	
	if direction == 1 && ray_left.is_colliding():
		movex(delta)
	elif direction == -1 && ray_right.is_colliding():
		movex(delta)
	
func movex(delta):
	position.x += speed * direction * delta
