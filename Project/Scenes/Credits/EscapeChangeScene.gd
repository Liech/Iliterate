extends SceneRoot


func DoCommand(command):
	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
	else:
		super.DoCommand(command)
	
