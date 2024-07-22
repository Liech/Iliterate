extends Panel

var visibility = 0;
var dialogActive = false;

var ProtoButton;

signal choiceMade

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.dialog = self
	ProtoButton = $MarginContainer/VBoxContainer/HBoxContainer/ProtoButton

func _process(delta):
	adjustVisibility();
	
func setCharacter(texture):
	$Character.texture = texture;
	
func setCharacterName(name):
	$"MarginContainer/VBoxContainer/Character Name".text = name
	
func setText(t):
	$MarginContainer/VBoxContainer/MarginContainer/Content.text = t
	
func choicePressed(choiceName):
	choiceMade.emit(choiceName)

func setChoices(choices):
	var choiceParent = $MarginContainer/VBoxContainer/Choices
	for i in range(10):
		choiceParent.get_child(i).visible = false
	for i in len(choices):
		var choice = choices[i];
		var button = choiceParent.get_child(i);
		button.text = choice;
		button.visible = true;

func adjustVisibility():
	if (dialogActive):
		if (visibility <= 1):
			visibility += 0.05;
	else:
		if (visibility > 0):
			visibility-= 0.05;
		else:
			visible = false
	modulate.a = visibility
	

func closeDialog():
	dialogActive = false;

func openDialog():
	dialogActive = true;
	visible = true
