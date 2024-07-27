extends SceneRoot


func _ready():
	#await get_tree().create_timer(0.1).timeout
	#$"Back/UwU".startDialog()
	pass

func DoCommand(command):
	super.DoCommand(command)

	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
