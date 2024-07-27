extends TextureRect

var startpos
var jiggling = false

func _ready():
	startpos = position

func jiggle():
	jiggling = true
	await get_tree().create_timer(0.8).timeout
	jiggling = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (jiggling):
		position = startpos + Vector2(30.0 * (randi()%30) / 30.0,30.0 * (randi()%30) / 30.0)
