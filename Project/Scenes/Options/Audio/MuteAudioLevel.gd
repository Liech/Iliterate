extends CloneableCheckBox


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("AudioOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (button_pressed  != GlobalOptions.muteAudio):
		button_pressed  = GlobalOptions.muteAudio


func _on_toggled(toggled_on):
	GlobalOptions.muteAudio = toggled_on
