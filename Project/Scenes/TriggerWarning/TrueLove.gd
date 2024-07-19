extends Button


func _on_pressed():
	gamestate.twChoice = "TrueLove";
	var tween = create_tween();
	var fadeout = get_tree().get_root().get_node("TriggerWarning/FadeOut")
	await tween.tween_property(fadeout,"modulate",Color(0,0,0,100),gamestate.fadeouttime).finished
	get_tree().change_scene_to_file("res://Scenes/StartScreen/StartScreen.tscn")

