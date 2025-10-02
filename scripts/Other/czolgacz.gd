extends Node2D

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

var direction = 1
const speed = 100

func _physics_process(delta: float) -> void:
	position.x += direction * speed * delta
	
	if ray_cast_right.is_colliding():
		direction = -1
	elif ray_cast_left.is_colliding():
		direction = 1
