extends Node2D

@onready var Trigger = $Area2D

func _ready() -> void:
	Trigger.body_entered.connect(FilterToPlayer)

func _process(delta: float) -> void:
	pass

func FilterToPlayer(body):
	var NewScene = get_tree().get_meta("To Scene")
	
	if(body.name == "The Knight" || body.name == "Test_Player"):
		print_debug("Scene_Change to: ", NewScene)
		
		#get_tree().change_scene_to_file("")
