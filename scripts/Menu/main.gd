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
		get_tree().change_scene_to_file("res://scenes/Menu/save_select.tscn")
	if(settingsbt.button_pressed):
		print_debug("Settings button pressed\n")
		get_tree().change_scene_to_file("res://scenes/Menu/settings.tscn")
	if(advancmentsbt.button_pressed):
		print_debug("Advancments button pressed\n")
		get_tree().change_scene_to_file("res://scenes/Menu/advancments.tscn")
	if(extrasbt.button_pressed):
		print_debug("Extras button pressed\n")
		get_tree().change_scene_to_file("res://scenes/Menu/extras.tscn")
	if(quitbt.button_pressed):
		print_debug("Quit button pressed\n")
		get_tree().quit()
