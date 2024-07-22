extends Control
class_name UwUDialog

@export var characterName : String
@export var characterBelly : String
@export var characterIcon : Texture2D
@export var startTextBlock : int = 0

var dialogActive = false
var currentBlock ="";

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func choiceMade(choice):
	closeDialog()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleConnection()
	
	
func setTextBlock(block):
	gamestate.dialog.setText(block.text);
	gamestate.dialog.setChoices(block.choices)
	currentBlock = block.name
	
func closeDialog():
	gamestate.dialog.closeDialog()
	dialogActive = false
	
func startDialog():
	gamestate.dialog.openDialog()
	gamestate.dialog.setCharacterName(characterName)
	gamestate.dialog.setBelly(characterBelly)
	gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
	setTextBlock(get_child(startTextBlock))
	dialogActive = true
	
func handleConnection():
	var UwUOnline = get_parent().is_connected("pressed",_on_pressed)
	var ParOnline = get_parent().is_connected("pressed",get_parent()._on_pressed)
	var dialogCon = gamestate.dialog.is_connected("choiceMade",choiceMade)
	var uwu = isUwU()
	
	if (uwu and ParOnline):
		get_parent().disconnect("pressed",get_parent()._on_pressed)
	if (uwu and not UwUOnline):
		get_parent().connect("pressed",_on_pressed)
	if (not uwu and UwUOnline):
		get_parent().disconnect("pressed",_on_pressed)
	if (not uwu and not ParOnline):
		get_parent().disconnect("pressed",get_parent()._on_pressed)
	if ((not dialogActive or not uwu) and dialogCon):
		gamestate.dialog.disconnect("choiceMade",choiceMade)
	if (dialogActive and uwu and not dialogCon):
		gamestate.dialog.connect("choiceMade",choiceMade)
		
func isUwU():
	return GlobalOptions.localization == GlobalOptions.Localization.UwU

func _on_pressed():
	startDialog();
