extends SceneRoot


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
