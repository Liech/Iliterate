extends CloneableButton

func _on_pressed():
	gamestate.fadeTo(gamestate.Scenes.MainMenu)
