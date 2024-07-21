extends CloneableHSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	add_to_group("MiscOption");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.brightness != value):
		value = GlobalOptions.opacity

func _on_value_changed(value):
	GlobalOptions.opacity = value

func _on_drag_started():
	gamestate.snapActive = false


func _on_drag_ended(value_changed):
	gamestate.snapActive = true
