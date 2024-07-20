extends Control

var nextscenedelay = 2
var deletepindelay = 2
var fadeout = 2

var alreadyPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if (alreadyPressed):
		return;
	alreadyPressed= true;
	$GodotSymbol.freeze = false;
	await get_tree().create_timer(deletepindelay).timeout
	$PinJoint2D.queue_free();
	await get_tree().create_timer(nextscenedelay).timeout
	gamestate.fadeTo(gamestate.Scenes.Triggerwarning);
