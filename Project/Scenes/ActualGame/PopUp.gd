extends Cloneable

func _ready():
	super()
	if (not isClone):
		gamestate.popup = self

func open():
	visible = true;
	
func close():
	visible = false;

func setText(text):
	$Label.text = text

func setButton(index, text, vis):
	$HBoxContainer.get_child(index).text = text;
	$HBoxContainer.get_child(index).visible = vis;
	
