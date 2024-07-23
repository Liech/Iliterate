extends CloneableButton


func _on_pressed():
	gamestate.dialog.choicePressed(englishText)
