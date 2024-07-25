extends "res://Generics/Cloneable.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vis = GlobalOptions.hints;
	visible = vis;
	$"RigidBody2D/CollisionShape2D".disabled = not vis;
	$"RigidBody2D/CollisionShape2D2".disabled = not vis;
