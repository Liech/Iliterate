extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(str(position.y + size.y))
	if (position.y + size.y > 1080): 
		position += Vector2(0, -0.8)
