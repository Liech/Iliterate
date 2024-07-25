extends Label
var rng = RandomNumberGenerator.new()

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(GlobalOptions.graphics == GlobalOptions.GraphicsQuality.High):
		modulate = Color(255,0,0)
		get_parent().get_node("FPS2").modulate = Color(255,0,0)
		text = str(rng.randf_range(-0.2, 0.1)).pad_decimals(2)
	if(GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Low):
		modulate = Color(255,255,255)
		get_parent().get_node("FPS2").modulate = Color(255,255,255)
		text = str(rng.randf_range(60.0, 61)).pad_decimals(1)
	if(GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato):
		modulate = Color(0,255,0)
		get_parent().get_node("FPS2").modulate = Color(0,255,0)
		text = "144"
	
		
