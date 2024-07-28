extends CloneableButton


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = GlobalOptions.dialog != GlobalOptions.DialogSpeed.Off
	pass


func _on_pressed():
	super()
	gamestate.dialog.closeDialog()
	if (gamestate.currentScene.name != "Options"):
		gamestate.fadeTo(gamestate.Scenes.Options);

