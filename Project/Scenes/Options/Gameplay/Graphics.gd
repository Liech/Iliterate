extends CloneableOptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("GameplayOption");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.High and selected != 0):
		selected = 0; 
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Low and selected != 1):
		selected = 1; 
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato and selected != 2):
		selected = 2; 

func _on_item_selected(index):
	gamestate.snapActive = true
	if (index == 0):
		GlobalOptions.graphics = GlobalOptions.GraphicsQuality.High;
	elif (index == 1):
		GlobalOptions.graphics = GlobalOptions.GraphicsQuality.Low;
	elif (index == 2):
		GlobalOptions.graphics = GlobalOptions.GraphicsQuality.Potato;
		
func _on_mouse_entered():
	super()
	gamestate.snapActive = false


func _on_mouse_exited():
	super()
	gamestate.snapActive = true


func _on_pressed():
	pass # Replace with function body.
