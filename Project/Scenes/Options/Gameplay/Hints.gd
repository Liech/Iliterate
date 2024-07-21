extends CloneableCheckBox


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("GameplayOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if (button_pressed  != GlobalOptions.hints):
		button_pressed  = GlobalOptions.hints


func _on_toggled(toggled_on):
	GlobalOptions.hints = toggled_on
