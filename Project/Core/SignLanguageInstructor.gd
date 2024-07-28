extends "res://Generics/Cloneable.gd"


var targetrot;
var targetrotthreshold = 0.1;

var explainStartTime
var explainStarted = false
var explainDuration = 1500

func _ready():
	super()
	targetrot = 0
	
func pawMovement(delta):
	var now = Time.get_ticks_msec()
	if (!explainStarted):
		explainStartTime = now
		explainStarted = true
	if (now-explainStartTime>explainDuration):
		return
		

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
		
		
		
