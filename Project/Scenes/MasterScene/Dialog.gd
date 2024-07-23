extends Panel

enum Bodies{ ButtonChan, Nothing }

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
	
func setCharacter(body):
	if (body == Bodies.ButtonChan):
		$ButtonChan.visible = true
	elif (body == Bodies.Nothing):
		$ButtonChan.visible = false
		
func setBelly(t):
	$"ButtonChan/ButtonChanBelly".text = t;
	$"ButtonChan/ButtonChanBelly".englishText = t
	
func setCharacterName(name):
	$"Character Name".text = name
	$"Character Name".englishText = name
	
func setText(t):
	$Content.text = t
	$Content.englishText = t
	
func choicePressed(choiceName):
	choiceMade.emit(choiceName)

func setChoices(choices):
	var choiceParent = $Choices
	for i in range(10):
		choiceParent.get_child(i).visible = false
	for i in len(choices):
		var choice = choices[i];
		var button = choiceParent.get_child(i);
		button.text = choice;	
		button.englishText = choice
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
	

var oldSnap
func closeDialog():
	dialogActive = false;
	gamestate.snapActive= oldSnap
	

func openDialog():
	oldSnap = gamestate.snapActive
	dialogActive = true;
	visible = true
	gamestate.snapActive = false
