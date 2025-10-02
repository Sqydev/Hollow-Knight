extends Button

var SaveOpp = SaveSystem.new()
var META

func _ready() -> void:
	META = self.get_meta("meta")

func _process(delta: float) -> void:
	if(button_pressed): SaveOpp.DoSaveOperation(META, 1)
