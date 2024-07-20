extends Control

var nextscenedelay = 2
var deletepindelay = 2
var fadeout = 2

var alreadyPressed = false

var goooo = preload("res://Sound/Gooo.wav")
var douh = preload("res://Sound/Douh.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	
	#gamestate.fadeTo(gamestate.Scenes.MainMenu);
	#return
	
	if (alreadyPressed):
		return;
	$Audio.stream = goooo
	$Audio.play()
	alreadyPressed= true;
	$GodotSymbol.freeze = false;
	await get_tree().create_timer(deletepindelay).timeout
	$PinJoint2D.queue_free();
	await get_tree().create_timer(nextscenedelay).timeout
	gamestate.fadeTo(gamestate.Scenes.Triggerwarning);

var audioplayed = false
func _on_godot_symbol_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (not audioplayed):
		audioplayed = true
		$Audio.stream = douh
		$Audio.play()
