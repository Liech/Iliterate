extends RigidBody2D

var breaks = false;
var breakerActive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	createClickSound()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	breakerActive = get_child(2).visible


var broken = false;
func _on_body_entered(body):
	var layer =body.collision_layer 
	if (layer == 1):
		if (broken):
			return;
		var speed = linear_velocity.length()
		if (speed > 40):
			$Click.play()
		get_child(2).touchedGround();
		if (breaks):
			broken = true
			get_child(2).breakApart()
			queue_free();

func selfconnect():
	body_entered.connect(_on_body_entered)


func createClickSound():
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.1.ogg")
	c1.name = "Click"
	c1.volume_db = -10
	add_child(c1)
	
	pass
