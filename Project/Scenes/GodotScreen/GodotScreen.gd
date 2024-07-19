extends Control

@export var nextscenedelay = 2
@export var deletepindelay = 2
@export var fadeout = 2

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
	var tween = create_tween();
	await tween.tween_property($Fadeout,"modulate",Color(0,0,0,100),fadeout).finished
	get_tree().change_scene_to_file("res://Scenes/TriggerWarning/TriggerWarning.tscn")
