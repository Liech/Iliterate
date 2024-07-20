extends Button


func _on_pressed():
	gamestate.twChoice = "TrueLove";
	gamestate.fadeTo(gamestate.Scenes.Ubiscene)

