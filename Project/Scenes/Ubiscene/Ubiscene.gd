extends Control



@export var scenetime = 8;
var foreshadowing = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0*scenetime/3.0 - foreshadowing).timeout
	gamestate.musicPlayer.fadeStreamTo(GlobalOptions.Localization.Gibberish)
	await get_tree().create_timer(foreshadowing).timeout
	GlobalOptions.gibberishStarting = true
	await get_tree().create_timer(2.0*scenetime/3.0).timeout
	gamestate.fadeTo(gamestate.Scenes.StartScreen);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tree_exiting():
	GlobalOptions.setGibberish()
