extends Control



@export var scenetime = 8;

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0*scenetime/3.0).timeout
	GlobalOptions.gibberishStarting = true
	await get_tree().create_timer(2.0*scenetime/3.0).timeout
	gamestate.fadeTo(gamestate.Scenes.StartScreen);
	GlobalOptions.setGibberish()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
