extends SceneRoot

var choseKey;
var summoned;



func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.Options);
	elif (command == "Set"):
		GlobalOptions.jumpKey = choseKey.englishTexts[choseKey.selected]
		print(GlobalOptions.jumpKey)

		
