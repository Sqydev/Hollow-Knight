extends Area2D

@onready var the_knight: CharacterBody2D = $"."

var direction = 0
var speed = 100

func _physics_process(delta: float) -> void:
	if the_knight.position.x > position.x:
		direction = 1
	elif the_knight.position.x < position.x:
		direction = -1
	else: 
		direction = 0
	
	position.x += speed * direction * delta
