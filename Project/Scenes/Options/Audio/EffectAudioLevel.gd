extends CloneableHSlider

var bus := AudioServer.get_bus_index("Effect")


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("AudioOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.effectAudio != value):
		value = GlobalOptions.effectAudio
	AudioServer.set_bus_volume_db(bus, linear_to_db(GlobalOptions.effectAudio / 100.0))


func _on_value_changed(value):
	GlobalOptions.effectAudio = value

func _on_drag_started():
	gamestate.snapActive = false


func _on_drag_ended(value_changed):
	gamestate.snapActive = true
