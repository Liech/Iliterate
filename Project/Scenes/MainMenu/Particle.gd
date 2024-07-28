extends TextureRect


var ypos;
var time = 0
var isacopy = false

# Called when the node enters the scene tree for the first time.
func _ready():
	time += (randi()%200) / 50.0;
	ypos = position.y
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (position.x > 1920):
		position.x -= 1920
	time = time + delta
	position.x += 3
	position.y = ypos + sin(time) * 40
	pass
