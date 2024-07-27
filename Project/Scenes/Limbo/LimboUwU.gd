extends UwUDialog

const kitten = preload("res://Art/Menu/CatSignLanguageInterpreter.png")

func choiceMade(choice):
	if (choice == "Yeah!"):
		nextBlock()
	elif (choice == "continue"):
		nextBlock()
	elif (choice == "No"):
		gamestate.dialog.get_node("Demon").texture = kitten
		gamestate.dialog.get_node("Demon").visible = true
		nextBlock()
	elif (choice == "mh?"):
		GlobalOptions.setUwU()
		GlobalOptions.gibberishStarting = false
		gamestate.dialog.setCharacterName("Life")
		nextBlock()
	elif (choice == "Awww"):
		nextBlock()
	elif (choice == "Yes"):
		if (currentBlock == $YouSuck):
			GlobalOptions.setGibberish()
			nextBlock()
		else:
			GlobalOptions.gibberishStarting = true
			gamestate.dialog.setCharacterName("New Boss")
			nextBlock()
	elif (choice == "Okay.."):
		gamestate.currentScene.DoCommand("Back");		
		closeDialog()
	else:
		pass
