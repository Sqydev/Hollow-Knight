extends Control

@onready var playbt = $"Start Game"
@onready var settingsbt = $Options
@onready var advancmentsbt = $Advancments
@onready var extrasbt = $Extras
@onready var quitbt = $"Quit Game"

func _ready() -> void:
	pass

func _process(delta: float) -> void:

	if(playbt.button_pressed):
		print_debug("Play button pressed\n")
	if(settingsbt.button_pressed):
		print_debug("Settings button pressed\n")
	if(advancmentsbt.button_pressed):
		print_debug("Advancments button pressed\n")
	if(extrasbt.button_pressed):
		print_debug("Extras button pressed\n")
	if(quitbt.button_pressed):
		print_debug("Quit button pressed\n")
