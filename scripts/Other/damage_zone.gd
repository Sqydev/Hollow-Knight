extends Area2D

@onready var the_knight: CharacterBody2D = $"."

var damage = get_parent().get_meta("damage")

func _on_body_entered(body):
	the_knight.deal_damage(damage)
