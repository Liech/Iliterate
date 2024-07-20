extends TextureRect

var pasteReality = false;
var moveto;
var body;

func _ready():
	add_to_group("Copyable");
	
	if (pasteReality):
		var oldpos = get_parent().position
		get_parent().remove_child(self)
		gamestate.currentScene.add_child(self);
		#var p = position
		position += moveto 
		visible = true
		set_process(true)
		

func _process(delta):
	position.y += 2
	if (position.y > 1380):
		queue_free();
	
func cloneObject(panel, captureReality, ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	result.pasteReality = not captureReality
	result.moveto = ppos;
	result.position = self.position
	panel.add_child(result)
	return result
