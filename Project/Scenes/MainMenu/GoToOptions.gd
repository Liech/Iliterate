extends Button

var isClone = false

func _ready():
	if (not isClone):
		add_to_group("Copyable");

func _on_pressed():
	gamestate.fadeTo(gamestate.Scenes.Options);


func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	result.isClone = true
	panel.add_child(result);
	if (move):
		result.position = result.position - panel.position
	return result
