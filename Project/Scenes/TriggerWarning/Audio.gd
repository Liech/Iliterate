extends Button


func _on_pressed():
	gamestate.twChoice = "Audio";
	gamestate.fadeTo(gamestate.Scenes.Ubiscene)

