extends Area2D

@onready var the_knight: CharacterBody2D = $"."

func _on_body_entered():
	the_knight.deal_damage("metadata/damage")
