extends CloneableCheckBox

var bus := AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("AudioOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if (button_pressed  != GlobalOptions.muteAudio):
		button_pressed  = GlobalOptions.muteAudio
	AudioServer.set_bus_mute(bus,GlobalOptions.muteAudio)


func _on_toggled(toggled_on):
	if (GlobalOptions.Localization.CatSignLanguage == GlobalOptions.localization):
		if (not grounded):
			return;
	
	GlobalOptions.muteAudio = toggled_on
