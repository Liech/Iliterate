extends Button

func _ready():
	add_to_group("Copyable");

func _on_pressed():
	gamestate.fadeTo(gamestate.Scenes.MainMenu);
	

func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	panel.add_child(result);
	if (move):
		result.position = result.position - panel.position
	return result

