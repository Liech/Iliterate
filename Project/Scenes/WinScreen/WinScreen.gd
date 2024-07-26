extends SceneRoot


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Continue"):
		gamestate.fadeTo(gamestate.Scenes.Credits);
		
