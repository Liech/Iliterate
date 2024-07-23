extends UwUDialog

func startup():
	#if (get_parent().tabname() == gamestate.currentTab):
	#	setTextBlock($AlreadyThere)
	pass

func choiceMade(choice):
	if (choice == "Enter"):
		gamestate.fadeTo(gamestate.Scenes.KeyBinding)
		closeDialog();
	elif (choice == "Knock"):
		setTextBlock($DoorAnswer)
		gamestate.dialog.setCharacterName("???");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("???")
	elif (choice == "I want to Join the Club"):
		setTextBlock($ComeIn)		
	elif (choice == "Nothing, sorry"):
		setTextBlock($Angry)
	else:
		closeDialog();
