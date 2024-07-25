extends SceneRoot

func DoCommand(command):
	super.DoCommand(command)

	if (command == "Start Game"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
		
