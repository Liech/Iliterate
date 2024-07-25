extends Label

var fadetime = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.buttonLabel= self
	pass # Replace with function body.

func flash(t):
	text = t;
	modulate.a = 0.01;
	visible = true
	
	var tween = create_tween();
	await tween.tween_property(self,"modulate",Color(1.0,1.0,1.0,1.0),fadetime).finished
	var tween2 = create_tween();
	await tween2.tween_property(self,"modulate",Color(1.0,1.0,1.0,0.0),fadetime).finished
	
	
	visible = false;
