extends UwUDialog



func choiceMade(choice):
	get_parent()._on_pressed()
	if (currentBlock == $Intro):
		if (choice == "Yes"):
			setTextBlock($Happy);
		else:
			setTextBlock($Anger);
	elif (currentBlock == $Happy):
		closeDialog();
		gamestate.currentScene.DoCommand("Back");		
	elif (currentBlock == $Anger):
		closeDialog();
