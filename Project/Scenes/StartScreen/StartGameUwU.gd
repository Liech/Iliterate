extends UwUDialog

var dotCounter = 0;
func startup():
	dotCounter = 0

func choiceMade(choice):
	if (choice == "Run Away"):
		closeDialog();
	elif (choice == "Good"):
		setTextBlock($Revelation);		
	elif (choice == "..."):
		if (currentBlock == $Revelation):
			setTextBlock($OhNo)
			gamestate.dialog.setCharacter(gamestate.dialog.Bodies.Nothing)
			gamestate.dialog.setCharacterName("You - But Younger")
		else:
			gamestate.dialog.setCharacterName("Start Game - Your Old English Teacher");
			GlobalOptions.localization = GlobalOptions.Localization.Gibberish;
			gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
			setTextBlock($NotListening)
	elif (choice == "Flee"):
		get_parent()._on_pressed()
		closeDialog();
