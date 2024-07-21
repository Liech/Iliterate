extends CloneableOptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("GameplayOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.dialog == GlobalOptions.DialogSpeed.High and selected != 0):
		selected = 0; 
	if (GlobalOptions.dialog == GlobalOptions.DialogSpeed.Low and selected != 1):
		selected = 1; 
	if (GlobalOptions.dialog == GlobalOptions.DialogSpeed.Off and selected != 2):
		selected = 2; 

func _on_item_selected(index):
	gamestate.snapActive = true
	if (index == 0):
		GlobalOptions.dialog = GlobalOptions.DialogSpeed.High;
	elif (index == 1):
		GlobalOptions.dialog = GlobalOptions.DialogSpeed.Low;
	elif (index == 2):
		GlobalOptions.dialog = GlobalOptions.DialogSpeed.Off;
		
func _on_mouse_entered():
	gamestate.snapActive = false


func _on_mouse_exited():
	gamestate.snapActive = true


func _on_pressed():
	pass # Replace with function body.
