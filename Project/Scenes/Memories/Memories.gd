extends SceneRoot

var tutorialOpen = false
var oldManOpen = false

func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Back"):
		if (tutorialOpen):
			$TutorialPopUp.visible = false
			tutorialOpen = false
		elif (oldManOpen):
			$OldManDialog.visible = false
			oldManOpen = false
		else:
			gamestate.fadeTo(gamestate.Scenes.MainMenu);
	elif (command == "Tutorial"):
		tutorialOpen = true
		$TutorialPopUp.visible = true
	elif (command == "..."):
		pass
	elif (command == "???" and GlobalOptions.localization == GlobalOptions.Localization.Gibberish):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
	elif(command == "???"):
		$OldManDialog.visible = true
		oldManOpen = true		
	if (command == "Close"):
		oldManOpen = false
		$TutorialPopUp.visible = false
		$OldManDialog.visible = false
		tutorialOpen = false
