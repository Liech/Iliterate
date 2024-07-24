extends UwUDialog



func choiceMade(choice):
	if (choice == "Thanks. Bye."):
		GlobalOptions.masterAudio -= 20;
		if (GlobalOptions.masterAudio < 0):
			GlobalOptions.masterAudio = 0;
		get_parent().value = GlobalOptions.masterAudio
		closeDialog()
	elif (choice == "Smaaaash!"):
		GlobalOptions.masterAudio += 20;
		if (GlobalOptions.masterAudio > 100):
			GlobalOptions.masterAudio = 100;
		get_parent().value = GlobalOptions.masterAudio
		closeDialog()
	elif (choice == "Too Loud. Tune it down!"):
		setTextBlock($TuneDown)
	elif (choice == "Louder!"):
		setTextBlock($TuneUp)
	elif (choice == "Listen"):
		nextBlock()		
		gamestate.dialog.setCharacterName("Master - Music Club Singer");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("Master")	
	elif (choice == "continue"):	
		nextBlock()		
		gamestate.dialog.setCharacterName("Effect - Music Club Drummer");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("Effect")	
	else:
		closeDialog()
