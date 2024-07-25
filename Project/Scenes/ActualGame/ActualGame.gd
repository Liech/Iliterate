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
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Low):
		$Background.material.set_shader_parameter("size", Vector2(1,1))
		$Background.material.set_shader_parameter("disabled", false)
		$Background.material.set_shader_parameter("size", Vector2(4,4))
		$Terrain.material.set_shader_parameter("size", Vector2(1,1))
		$Terrain.material.set_shader_parameter("disabled", false)
		$Terrain.material.set_shader_parameter("size", Vector2(4,4))
	if (GlobalOptions.graphics == GlobalOptions.GraphicsQuality.Potato):
		$Background.material.set_shader_parameter("disabled", false)
		$Background.material.set_shader_parameter("size", Vector2(15,15))
		$Terrain.material.set_shader_parameter("disabled", false)
		$Terrain.material.set_shader_parameter("size", Vector2(15,15))


func DoCommand(command):
	super.DoCommand(command)
	
	if (command == "Loose"):
		gamestate.playerpos = gamestate.playerposstart
		gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
		gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
		gamestate.fadeTo(gamestate.Scenes.LooseScreen);
	if (command == "Back"):
		gamestate.Postprocessor.material.set_shader_parameter("vsyncAmount", 0)
		gamestate.Postprocessor.material.set_shader_parameter("vsyncpos", 0)
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
		gamestate.playerpos = $Player.position
