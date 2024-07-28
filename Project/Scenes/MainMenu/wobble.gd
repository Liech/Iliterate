extends Cloneable

var startpos;
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	time = (randi()%30)/10.0
	startpos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position = startpos + Vector2()
	time+=delta
	position.y = startpos.y + sin(time) * 20
	pass
