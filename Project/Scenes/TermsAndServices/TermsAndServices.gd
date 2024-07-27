extends SceneRoot


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Proceed"):
		if ($AgreeField.text == "Agree"):
			gamestate.fadeTo(gamestate.Scenes.ActualGame);
			gamestate.termsagreed = true
		else:
			$AngryNote.visible = true
	elif (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
