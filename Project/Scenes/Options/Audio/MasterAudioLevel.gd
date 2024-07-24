extends CloneableHSlider

var bus := AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("AudioOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.masterAudio != value):
		value = GlobalOptions.masterAudio
	var level = GlobalOptions.masterAudio / 100.0
	
	AudioServer.set_bus_volume_db(bus, linear_to_db(level))

func _on_value_changed(value):
	GlobalOptions.masterAudio = value

func _on_drag_started():
	gamestate.snapActive = false


func _on_drag_ended(value_changed):
	gamestate.snapActive = true
