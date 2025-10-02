extends Node2D

@onready var Fame = $CanvasLayer/ColorRect

func _ready() -> void:
	Fame.fade_in(0.6)
	
	var Knight = get_node("../The Knight")
	
	if(Knight.get_meta("SendFromId") == self.get_meta("ReciveId")):
		Knight.position = self.position
		Knight.set_meta("SendFromId", -1)
