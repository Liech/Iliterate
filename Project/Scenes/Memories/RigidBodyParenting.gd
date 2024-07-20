extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().position += position
	get_parent().rotation += rotation
