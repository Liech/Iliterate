extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.deleteHint = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = gamestate.snapPanelCount > 0
	pass


func _on_tree_entered():
	pass # Replace with function body.
