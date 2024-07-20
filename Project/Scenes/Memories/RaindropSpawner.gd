extends Panel


@export var propability = 0.05
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Copyable");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (rng.randf_range(0,1)< propability):
		var drop = ResourceLoader.load("res://Scenes/Memories/Raindrop.tscn")
		var dropi = drop.instantiate();		
		gamestate.currentScene.add_child(dropi)
		dropi.global_position = Vector2(rng.randf_range(global_position.x,global_position.x+size.x),global_position.y)

func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	panel.add_child(result);
	if (move):
		result.position = result.position - panel.position
	return result
