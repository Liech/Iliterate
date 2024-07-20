extends Control



@export var scenetime = 8;

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(scenetime).timeout
	gamestate.fadeTo(gamestate.Scenes.StartScreen);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
