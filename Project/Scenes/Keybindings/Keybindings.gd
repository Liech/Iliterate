extends SceneRoot

var choseKey;




func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.Options);
	elif (command == "Set"):
		GlobalOptions.jumpKey = choseKey.get_item_text(choseKey.selected)

		
