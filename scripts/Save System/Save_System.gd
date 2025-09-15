extends Node

var SaveFolder
var FileSlotGlob

func readySave(Mode, FileSlot):
	var KelnerOfUser = OS.get_name();
	FileSlotGlob = FileSlot
	
	if(KelnerOfUser == "Windows"):
		SaveFolder = "user://HollowKnightRecreation/";
	elif(KelnerOfUser == "Linux"):
		SaveFolder = "~/.local/HollowKnightRecreation/";
	else:
		print("Os unsuported");
	
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

func ScanSave():
	if(FileAccess.file_exists(SaveFolder + FileSlotGlob + ".SAVE")):
		# File does exist
		return 0;
	else:
		# File does NOT exist
		return 1;

func NewFile():
	if(DirAccess.open(SaveFolder) == null):
		DirAccess.make_dir_absolute(SaveFolder);
		NewFile();
	else:
		var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVE", FileAccess.WRITE);
		if(file != null):
			# Room
			file.store_string("NULL")
			file.store_string("\n")
			# Bench Id
			file.store_string("NULL")
			file.store_string("\n")
			
			file.close()

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
					get_tree().change_scene_to_file(LineContent);
				2:
					# TODO: Jak będą ławeczki to zrób savowanie jaka
					pass
					
			LineLocation += 1
		
		file.close()

func SaveFile():
	var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVE", FileAccess.WRITE)
	if(file != null):
		# Zapisz pokój
		file.overwrite_line(SaveFolder + FileSlotGlob + ".SAVE", 0, get_tree().current_scene)
		
		file.close()

func DeleteFile():
	# Delete save
	DirAccess.remove_absolute(SaveFolder + FileSlotGlob + ".SAVE")
