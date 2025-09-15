extends Node
class_name SaveSystem

var SaveFolder
var FileSlotGlob

func DoSaveOperation(Mode, FileSlot):
	FileSlotGlob = str(FileSlot)
	
	SaveFolder = "user://Saves/";
	
	if(Mode == 0):
		ScanSave();
	elif(Mode == 1):
		NewFile();
		OpenSave();
	elif(Mode == 2):
		OpenSave();
	elif(Mode == 3):
		SaveFile();
	elif(Mode == 4):
		DeleteFile();

# Działa 100%
func ScanSave():
	if(FileAccess.file_exists(SaveFolder + FileSlotGlob + ".SAVE")):
		# File does exist
		print_debug("Save exists")
		return 0;
	else:
		# File does NOT exist
		print_debug("Save dont")
		return 1;

# Działa 100%
# TODO: Jak misiu zrobi główną scenę to usuń to "res://scenes/Menu/main.tscn"
func NewFile():
	if(DirAccess.open(SaveFolder) == null):
		DirAccess.make_dir_recursive_absolute(SaveFolder);
		
	var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVE", FileAccess.WRITE);
	if(file != null):
		# Room
		file.store_string("res://scenes/Menu/main.tscn")
		file.store_string("\n")
		# Bench Id
		file.store_string("NULL")
		file.store_string("\n")
		
		file.close()

# Nie działa:(
func OpenSave():
	var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVE", FileAccess.READ)
	if(file != null):
		var LineLocation = 1
		var LineContent
		
		while(!file.eof_reached()):
			LineContent = file.get_line()
			
			# Patrz na linie i każda linia za coś odpowiada(Patrz NewFile())
			match(LineLocation):
				1:
					print_debug("Chainging scene to: ", LineContent)
					get_tree().change_scene_to_file(LineContent);
				2:
					# TODO: Jak będą ławeczki to zrób savowanie jaka
					pass
					
			LineLocation += 1
		
		file.close()

# TODO: Sprawdz czy działa
func SaveFile():
	var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVE", FileAccess.WRITE)
	if(file != null):
		# Zapisz pokój
		file.overwrite_line(SaveFolder + FileSlotGlob + ".SAVE", 0, get_tree().current_scene)
		
		file.close()

# Działa 100%
func DeleteFile():
	# Delete save
	DirAccess.remove_absolute(SaveFolder + FileSlotGlob + ".SAVE")
