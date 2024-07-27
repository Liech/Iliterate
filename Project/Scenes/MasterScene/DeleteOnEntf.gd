extends Panel


func _ready():
	gamestate.snapPanelCount += 1;
	connect("tree_exited",_on_tree_entered)

func _on_tree_entered():
	gamestate.snapPanelCount -= 1;

func _process(delta):
	var mouse = get_local_mouse_position()
	var myrec = Rect2(Vector2(0,0),self.size)
	var delPressed = Input.is_key_pressed(KEY_DELETE)
	var inside = myrec.has_point(mouse)
	if inside:
		pass
	if (inside and delPressed):
		self.queue_free()

