extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var broken = false;
func _on_body_entered(body):
	var layer =body.collision_layer 
	if (layer == 1):
		if (broken):
			return;
		broken = true
		get_child(1).breakApart()
		queue_free();

func selfconnect():
	body_entered.connect(_on_body_entered)
