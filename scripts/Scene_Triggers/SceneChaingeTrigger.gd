extends Node2D

@onready var Trigger = $Area2D
@onready var Fame = $CanvasLayer/ColorRect

func _ready() -> void:
	await Fame.fade_in(0.5)
	Trigger.body_entered.connect(FilterToPlayer)

func _process(delta: float) -> void:
	pass

func FilterToPlayer(body):
	if body.name != "The Knight":
		return
	
	var NewScene = "res://scenes/" + self.get_meta("ToScene") + ".tscn"
	
	if(body.name == "The Knight"):
		print_debug("Scene_Change to: ", NewScene)
		
		await Fame.fade_out(0.5)
		
		get_tree().change_scene_to_file(NewScene)
