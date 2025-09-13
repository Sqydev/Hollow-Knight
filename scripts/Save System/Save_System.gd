extends Node

func readySave(Mode):
	var KelnerOfUser = OS.get_name();
	
	if(KelnerOfUser == "Windows"):
		const SaveFolder = "user://HollowKnightRecreation/";
	elif(KelnerOfUser == "Linux"):
		const SaveFolder = "~/.local/HollowKnightRecreation/";
	else:
		print("Os unsuported");
	
	if(Mode == 1):
		NewFile();
	elif(Mode == 2):
		SaveFile();
	elif(Mode == 3):
		DeleteFile();

func NewFile():
	pass;

func SaveFile():
	pass;

func DeleteFile():
	pass;
