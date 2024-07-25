extends TextureRect

var player;
var interacted = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player");


func talk():
	print("Talk");
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dist = player.position.distance_to(position)
	if (dist < 80):
		if (not interacted):
			interacted = true;
			talk();
	else:
		interacted = false;
