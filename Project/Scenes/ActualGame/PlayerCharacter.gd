extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -530.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var doflip = false;

func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	var jumpPressed = false;
	if (GlobalOptions.jumpKey == "E"):
		jumpPressed = Input.is_key_pressed(KEY_E)
	if jumpPressed and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if (Input.is_key_pressed(KEY_A)):
		direction = -1;
	elif (Input.is_key_pressed(KEY_D)):
		direction = 1;
	if (direction != 0):
		doflip = direction < 0
	$Sprite2D.flip_h = doflip
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
