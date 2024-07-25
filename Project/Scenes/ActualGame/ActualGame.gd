extends SceneRoot

func _process(delta):
	if ($Player.position.y > 1080):
		DoCommand("Loose");

func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Loose"):
		gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
		gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
		gamestate.fadeTo(gamestate.Scenes.LooseScreen);
	if (command == "Back"):
		gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
		gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
