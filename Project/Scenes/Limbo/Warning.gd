extends CloneableLabel

var time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time +=delta
	modulate.a = 1.0-abs(cos(time / 8.0))
