extends UwUDialog



func choiceMade(choice):
	if (choice == "sure"):
		nextBlock()
	elif (choice == "continue"):
		nextBlock()
	elif (choice == "me neither"):
		nextBlock()
	else:
		closeDialog()
