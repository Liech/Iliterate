extends UwUDialog

func startup():
	if (not get_parent().button_pressed):
		setTextBlock($Absent)
	pass

func choiceMade(choice):
	if (choice == "Ignore"):
		closeDialog();
	elif (choice == "Greet"):
		setTextBlock($Greeted)
		gamestate.dialog.setCharacterName("VSync - Torn Apart");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("VSync")
	elif (choice == "What?"):
		setTextBlock($Kidding)
	else:
		closeDialog();
		
