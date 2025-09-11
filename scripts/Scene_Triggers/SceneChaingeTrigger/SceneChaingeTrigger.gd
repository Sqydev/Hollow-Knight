extends Node2D

@onready var Trigger = $Area2D
@onready var Fame = $CanvasLayer/ColorRect

func _ready() -> void:
	Trigger.body_entered.connect(FilterToPlayer)

func _process(delta: float) -> void:
	pass

func FilterToPlayer(body):
	if body.name != "The Knight":
		return
	
	var NewScene = "res://scenes/" + self.get_meta("ToScene") + ".tscn"
	
	if(body.name == "The Knight"):
		print_debug("Scene_Change to: ", NewScene)
		
		await Fame.fade_out(0.6)
		
		var Knight = get_node("../The Knight")
		Knight.set_meta("SendFromId", self.get_meta("SendId"))
		
		print_debug("From metadata: ", Knight.get_meta("SendFromId"))
		
		get_tree().change_scene_to_file(NewScene)
