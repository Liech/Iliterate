extends UwUDialog



func choiceMade(choice):
	if (choice == "Any Tips?"):
		setTextBlock($Tipps)
	elif (choice == "Anything interesting out there?"):
		nextBlock()
	elif (choice == "Bye"):
		closeDialog()
	elif (choice == "Ok"):
		gamestate.fadeTo(gamestate.Scenes.Credits)
		closeDialog()
	elif (choice == "Sure"):
		nextBlock()
	elif (choice == "No"):
		setTextBlock($MovieNo)
	elif (choice == "continue"):
		nextBlock()
	else:
		closeDialog()
