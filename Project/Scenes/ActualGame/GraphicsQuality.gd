extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.High):
		material.set_shader_parameter("disabled", true)
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Low):
		material.set_shader_parameter("size", Vector2(1,1))
		material.set_shader_parameter("disabled", false)
		material.set_shader_parameter("size", Vector2(4,4))
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato):
		material.set_shader_parameter("disabled", false)
		material.set_shader_parameter("size", Vector2(15,15))
