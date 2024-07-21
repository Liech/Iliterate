extends CloneableOptionButton

var catPaw = load("res://Art/Menu/CatCursor.png")
var uwuPaw = load("res://Art/Menu/UwUCursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("GameplayOption");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if (GlobalOptions.localization == GlobalOptions.Localization.English and selected != 0):
		selected = 0; 
	if (GlobalOptions.localization == GlobalOptions.Localization.UwU and selected != 1):
		selected = 1; 
	if (GlobalOptions.localization == GlobalOptions.Localization.CatSignLanguage and selected != 2):
		selected = 2; 
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish and selected != 3):
		selected = 3; 

func _on_item_selected(index):
	gamestate.snapActive = true
	if (index == 0):
		GlobalOptions.localization = GlobalOptions.Localization.English;
		Input.set_custom_mouse_cursor(null)
	elif (index == 1):
		GlobalOptions.localization = GlobalOptions.Localization.UwU;
		Input.set_custom_mouse_cursor(uwuPaw,0,Vector2(19,4))
	elif (index == 2):
		GlobalOptions.localization = GlobalOptions.Localization.CatSignLanguage;
		Input.set_custom_mouse_cursor(catPaw,0,Vector2(10,14))
	elif (index == 3):
		GlobalOptions.localization = GlobalOptions.Localization.Gibberish;
		Input.set_custom_mouse_cursor(null)
		
func _on_mouse_entered():
	super()
	gamestate.snapActive = false


func _on_mouse_exited():
	super()
	gamestate.snapActive = true


func _on_pressed():
	pass # Replace with function body.
