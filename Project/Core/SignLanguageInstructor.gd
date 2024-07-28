extends "res://Generics/Cloneable.gd"

var miau1 = preload("res://Sound/Miau/Miau1.wav")
var miau2 = preload("res://Sound/Miau/Miau2.wav")
var miau3 = preload("res://Sound/Miau/Miau3.wav")
var miau4 = preload("res://Sound/Miau/Miau4.wav")
var miau5 = preload("res://Sound/Miau/Miau5.wav")
var miau6 = preload("res://Sound/Miau/Miau6.wav")
var miau7 = preload("res://Sound/Miau/Miau7.wav")
var miau8 = preload("res://Sound/Miau/Miau8.wav")
var miau9 = preload("res://Sound/Miau/Miau9.wav")
var allmiau;

var targetrot;
var targetrotthreshold = 0.1;

var explainStartTime
var explainStarted = false
var explainDuration = 1500

func _ready():
	super()
	createMiauSound()
	targetrot = 0
	
func pawMovement(delta):
	var now = Time.get_ticks_msec()
	if (!explainStarted):
		explainStartTime = now
		explainStarted = true
	if (now-explainStartTime>explainDuration):
		return
		
	if (not $Miau.playing):
		$Miau.stream = allmiau[randi()%len(allmiau)]
		$Miau.play()

	if (abs(targetrot-rotation) < targetrotthreshold):
		targetrot = randf() - 0.5
		
	if (rotation - targetrot < 0):
		rotation += delta * 5
	else:
		rotation -= delta * 5

var mousePressed = false
func doCatThings():
	var pressed = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT);
	if (mousePressed != pressed and pressed):
		var pos = get_global_mouse_position();
		var space_state = get_world_2d().direct_space_state
		var params = PhysicsPointQueryParameters2D.new()
		params.collision_mask = 2
		params.position = get_global_mouse_position()
		var out = space_state.intersect_point(params,1)
		for result in out:
			var col  : RigidBody2D= result.collider;
			if (not col.breakerActive):
				continue;
			col.freeze = false
			col.angular_velocity = (randf() -0.5) * 9
			col.linear_velocity = Vector2((randf() -0.5) * 8,(randf() -0.5) * 8)
			col.collision_mask = 1
			col.collision_layer = 1
			
	mousePressed = pressed;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalOptions.localization == GlobalOptions.Localization.CatSignLanguage:
		doCatThings();
		visible = true;
		if (gamestate.catExplain):
			pawMovement(delta)
		else:
			targetrot= 0
			explainStarted = false
			var diff = abs(targetrot-rotation);
			if (diff < targetrotthreshold*3):
				rotation = 0
			else:
				if (rotation - targetrot < 0):
					rotation += delta * 5
				else:
					rotation -= delta * 5
	else:
		visible = false;
		targetrot = 0
		explainStarted = false
		
		
		

func createMiauSound():
	allmiau = [miau1,miau2,miau3,miau4,miau5,miau6,miau7,miau8,miau9]
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.1.ogg")
	c1.name = "Miau"
	c1.volume_db = 5
	add_child(c1)
	
	pass
