extends Button


func _on_pressed():
	gamestate.twChoice = "Confusion";
	get_tree().change_scene_to_file("res://Scenes/StartScreen/StartScreen.tscn")

