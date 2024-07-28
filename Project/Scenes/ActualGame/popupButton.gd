extends CloneableButton


func _on_pressed():
	$Click.play()
	
	gamestate.buttonLabel.flash(text);
	gamestate.currentScene.DoCommand(text);
