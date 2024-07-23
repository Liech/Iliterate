extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.Postprocessor = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bright = (GlobalOptions.brightness - 50) / 50.0 + 1.0
	material.set_shader_parameter("bright", bright)
