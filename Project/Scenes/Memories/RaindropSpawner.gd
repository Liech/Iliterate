extends Panel


@export var propability = 0.05
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
var isClone = false

func _ready():
	#if (not isClone):
		#add_to_group("Copyable");
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (rng.randf_range(0,1)< propability):
		var drop = get_child(0).cloneObject(gamestate.currentScene,false,Vector2(0,0))
		drop.isClone = false
		drop.process_mode = PROCESS_MODE_INHERIT
		drop.visible = true
		drop.add_to_group("Copyable");
		drop.global_position = Vector2(rng.randf_range(global_position.x,global_position.x+size.x),global_position.y)

func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	result.isClone = true
	panel.add_child(result);
	if (move):
		result.position = result.position - panel.position
	return result
