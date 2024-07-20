extends Button

func _ready():
	add_to_group("Copyable");

func _on_pressed():
	gamestate.fadeTo(gamestate.Scenes.Memories);

func cloneObject():
	var result = self.duplicate();
	result.theme = self.theme
	return result
