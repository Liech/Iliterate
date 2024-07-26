extends SceneRoot


func _ready():
	if not gamestate.playerposinitialized:
		gamestate.playerposinitialized = true
		gamestate.playerpos = $Player.position
		gamestate.playerposstart = $Player.position
	$Player.visible = true
	$Player.position = gamestate.playerpos;
	if ($Player.position.x < gamestate.playerposstart.x):		
		gamestate.playerpos = gamestate.playerposstart
		

func _process(delta):
	if ($Player.position.y > 1080):
		DoCommand("Loose");
	if ($Player.position.x <0):
		DoCommand("Loose");
		
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.High):
		$Terrain.material.set_shader_parameter("disabled", true)
		$Terrain.material.set_shader_parameter("disabled", true)
		$"Player/Sprite2D".material.set_shader_parameter("disabled", true)
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Low):
		$Background.material.set_shader_parameter("size", Vector2(1,1))
		$Background.material.set_shader_parameter("disabled", false)
		$Background.material.set_shader_parameter("size", Vector2(4,4))
		$Terrain.material.set_shader_parameter("size", Vector2(1,1))
		$Terrain.material.set_shader_parameter("disabled", false)
		$Terrain.material.set_shader_parameter("size", Vector2(4,4))
		$Terrain.material.set_shader_parameter("size", Vector2(1,1))
		$"Player/Sprite2D".material.set_shader_parameter("disabled", false)
		$"Player/Sprite2D".material.set_shader_parameter("size", Vector2(4,4))
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato):
		$Background.material.set_shader_parameter("disabled", false)
		$Background.material.set_shader_parameter("size", Vector2(15,15))
		$Terrain.material.set_shader_parameter("disabled", false)
		$Terrain.material.set_shader_parameter("size", Vector2(15,15))
		$"Player/Sprite2D".material.set_shader_parameter("disabled", false)
		$"Player/Sprite2D".material.set_shader_parameter("size", Vector2(15,15))


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Loose"):
		gamestate.playerpos = gamestate.playerposstart
		gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
		gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
		gamestate.fadeTo(gamestate.Scenes.LooseScreen);
	elif (command == "Back"):
		gamestate.popup.get_node("OldMan").visible = false
		gamestate.popup.get_node("Title").visible = false
		gamestate.popup.open();
		gamestate.popup.setText("Are you sure?");
		gamestate.popup.setButton(0,"Yes",true);
		gamestate.popup.setButton(1,"No",true);
		gamestate.popup.setButton(2,"Ok",false);		
		gamestate.popup.get_node("RollCreditsAndWinMachine").visible = false
	elif (command == "No"):
		gamestate.popup.close();		
	elif (command == "Start"):
		if (gamestate.actNumber > 0):
			gamestate.fadeTo(gamestate.Scenes.WinScreen);
	elif (command == "Yes"):
		if (not gamestate.popup.get_node("OldMan").visible):
			gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
			gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
			gamestate.fadeTo(gamestate.Scenes.MainMenu);
			gamestate.playerpos = $Player.position	
		else:
			gamestate.actNumber += 1
			$OldMan.talk();

	elif (command == "Close"):
		gamestate.popup.close();
