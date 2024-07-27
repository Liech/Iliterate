extends Cloneable


var time  = 0;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+= delta
	rotation = sin(time) * 2
	pass
