extends Control
class_name UwUDialog

@export var characterName : String
@export var characterBelly : String
@export var characterIcon : int
@export var ears : bool

var dialogActive = false
var currentBlock;

var earleftoffset = Vector2(44,50);
var earrightoffset = Vector2(44,50);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func choiceMade(choice):
	closeDialog()

func startup():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleConnection()
	
	if (ears):
		$"Graphics/Left".position = get_parent().position - earleftoffset
		$"Graphics/Right".position = get_parent().position + Vector2(get_parent().size.x,0.0) -earrightoffset
		$"Graphics/Left".visible = isUwU()
		$"Graphics/Right".visible = isUwU()
	
func setTextBlock(block):
	gamestate.dialog.setText(block.text);
	gamestate.dialog.setChoices(block.choices)
	currentBlock = block
	
func closeDialog():
	gamestate.dialog.closeDialog()
	dialogActive = false
	
func startDialog():
	gamestate.dialog.openDialog()
	gamestate.dialog.setCharacterName(characterName)
	gamestate.dialog.setBelly(characterBelly)
	setTextBlock(get_child(1))
	dialogActive = true
	
	if (characterIcon == 1):
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan);
	elif (characterIcon == 0):
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.Nothing);
	startup()
	
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
