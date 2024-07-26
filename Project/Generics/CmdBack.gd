extends Button

func _on_pressed():
	gamestate.buttonLabel.flash(text);
	gamestate.currentScene.DoCommand(text);
	
