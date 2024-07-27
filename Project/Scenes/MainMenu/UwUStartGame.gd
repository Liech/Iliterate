extends UwUDialog



func choiceMade(choice):
	if(choice == "Can you let me through?"):
		setTextBlock($Pass)
	elif(choice == "Whats up?"):
		setTextBlock($Storytime)
	elif(choice == "No. Bye."):
		setTextBlock($Sad)
	elif(choice == "You look like you can handle it."):
		setTextBlock($Storytime4)
	elif(choice == "Maybe he is right"):
		setTextBlock($PassBye)
	elif(choice == "No. Bye."):
		setTextBlock($Sad)
	elif(choice == "I don't care"):
		setTextBlock($PassThrough)
	elif(choice == "That is horrible"):
		setTextBlock($Storytime2)
	elif(choice == "Your dreams are messed up"):
		setTextBlock($Storytime3)
	elif(choice == "continue"):
		closeDialog()
	elif(choice == "I am an adventurer"):
		gamestate.limboscene = "Start Game"
		gamestate.fadeTo(gamestate.Scenes.Limbo)
		closeDialog()
	else:
		closeDialog()
