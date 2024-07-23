extends NinePatchRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato):
		texture = load("res://Art/Button/Potato.png")
	else:
		texture = load("res://Art/Button/Button.png")
