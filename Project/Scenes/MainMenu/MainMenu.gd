extends SceneRoot


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Memories"):
		gamestate.fadeTo(gamestate.Scenes.Memories);
	elif (command == "About"):
		gamestate.fadeTo(gamestate.Scenes.Credits);
	elif (command == "Loose"):
		gamestate.fadeTo(gamestate.Scenes.LooseScreen);
	elif (command == "Options"):
		gamestate.fadeTo(gamestate.Scenes.Options);
	elif (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.StartScreen);
	elif (command == "Start Screen"):
		gamestate.fadeTo(gamestate.Scenes.StartScreen);
	elif (command == "Start Game"):
		if (gamestate.termsagreed):
			gamestate.fadeTo(gamestate.Scenes.ActualGame);
		else:
			gamestate.fadeTo(gamestate.Scenes.TermsAndServices);
			
		
