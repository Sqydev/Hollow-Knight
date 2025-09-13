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
	
	if(Mode == 1):
		NewFile();
		OpenSave();
	elif(Mode == 2):
		OpenSave();
	elif(Mode == 3):
		SaveFile();
	elif(Mode == 4):
		DeleteFile();

func NewFile():
	if(DirAccess.open(SaveFolder) == null):
		DirAccess.make_dir_absolute(SaveFolder);
		NewFile();
	else:
		var file = FileAccess.open(SaveFolder + FileSlotGlob + ".SAVETHEWORLD", FileAccess.WRITE);
		if(file != null):
			file.store_string("NEWFILE;")
			file.close()

func OpenSave():
	pass

func SaveFile():
	pass;

func DeleteFile():
	pass;
