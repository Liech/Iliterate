extends UwUDialog



func choiceMade(choice):
	if (choice == "Stay"):
		closeDialog()
	else:
		get_parent()._on_pressed()
		closeDialog()
