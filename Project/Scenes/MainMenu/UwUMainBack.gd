extends UwUDialog



func choiceMade(choice):
	if (choice == "Can you let me through?"):
		setTextBlock($CanYouLetMeThrough);
	elif (choice == "Any tips?"):
		setTextBlock($tip)
	elif(choice == "I don't care"):
		gamestate.currentScene.DoCommand("Back");		
		closeDialog()		
	else:
		closeDialog()
