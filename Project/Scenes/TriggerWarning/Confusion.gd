extends Button


func _on_pressed():
	gamestate.twChoice = "Confusion";
	gamestate.fadeTo(gamestate.Scenes.StartScreen)

