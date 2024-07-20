extends NinePatchRect

var isActive = false;
var startPos = Vector2(-20,-20);
var endPos = Vector2(-20,-20);
var visibility = 0;

var screenshot;

@export var offset = 3.0
@export var fadeoutspeed = 0.02

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.snap = self
	isActive = false;
	self.visible = false

func _input( event ):
	if(not gamestate.snapActive):
		self.visible = false
		return;
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouseDown();
		if event.button_index == 1 and event.is_released():
			mouseUp();
	if (event is InputEventKey):
		if event.key_label == KEY_C and event.pressed and event.get_modifiers_mask() == KEY_MASK_CTRL:# and Input.is_key_pressed(KEY_CTRL):
			doCopy();
		if event.key_label == KEY_V and event.pressed and event.get_modifiers_mask() == KEY_MASK_CTRL:# and Input.is_key_pressed(KEY_CTRL):
			doPaste();

func _process(delta):
	if(not gamestate.snapActive):
		self.visible = false
		return;
	if (visibility < 0):
		self.visible = false
	if (isActive):
		var endPos = get_global_mouse_position()
		
		var realPos = startPos - Vector2(offset,offset)
		var realSize = (endPos-startPos)+ Vector2(offset,offset);
		if (endPos.x < startPos.x):
			realPos.x = endPos.x - offset;
			realSize.x = (startPos.x-endPos.x) + offset;
		if (endPos.y < startPos.y):
			realPos.y = endPos.y - offset;
			realSize.y = (startPos.y-endPos.y) + offset;
		
		self.position = realPos
		self.size = realSize
		
		var s = endPos-startPos
		if (abs(s.x) > 10 and abs(s.y) > 10): 
			self.visible = true;
		else:
			self.visible = false
	else:
		visibility -= fadeoutspeed
		self.modulate.a = visibility
	

func mouseDown():
	isActive = true;
	var mouse = get_global_mouse_position()
	self.position = mouse - Vector2(offset,offset)
	startPos = mouse
	endPos = mouse
	visibility = 1
	self.modulate.a = visibility

func mouseUp():
	isActive = false;

func doCopy():
	visibility = 1
	self.modulate.a = visibility
	self.visible = true;
	screenshot = get_viewport().get_texture() # We get what our player sees
		
func doPaste():
	var mouse = get_global_mouse_position()
	if (screenshot):
		var parent = gamestate.snapPool
		var rect = TextureRect.new()
		parent.add_child(rect)
		rect.position = mouse
		var imgtex = ImageTexture.create_from_image(screenshot.get_image())
		rect.texture = imgtex
