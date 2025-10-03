extends CharacterBody2D 


var speed = 200
var jump_force = -400
var gravity = 900
var velocity = Vector2.ZERO


onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	velocity.x = 0

	# Ruch w lewo/prawo
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		anim.flip_h = true


	velocity.y += gravity * delta


	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force


	velocity = move_and_slide(velocity, Vector2.UP)


	if not is_on_floor():
		anim.play("jump")
	elif velocity.x == 0:
		anim.play("idle")
	else:
		anim.play("run")
