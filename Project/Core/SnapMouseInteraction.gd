extends NinePatchRect

var isActive = false;
var startPos = Vector2(-20,-20);
var endPos = Vector2(-20,-20);
var visibility = 0;

var screenshot;
var screenshotPanel;
var capturedRect;

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
		isActive = false
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
		isActive = false
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
	captureReality();
	#screenshot = get_viewport().get_texture() # We get what our player sees
		
func doPaste():
	var mouse = get_global_mouse_position()
	if (screenshotPanel):
		pasteReality()
		visibility = 1
		self.modulate.a = visibility
		self.visible = true;

func pasteReality():
	var allNodes = [];
	getallnodes(screenshotPanel, allNodes)
	var selection = capturedRect

	var panel = Panel.new()
	panel.set_script(load("res://Scenes/MasterScene/DeleteOnEntf.gd"))
	gamestate.currentScene.add_child(panel);
	#panel.position = selection.position

	panel.size = selection.size
	for item in allNodes:
		if (item.is_in_group("Copyable")):
			var current = Rect2(item.global_position,item.size);
			item.cloneObject(panel, false,(get_global_mouse_position() - panel.size/2) - capturedRect.position)
	panel.modulate.a = 1
	panel.self_modulate.a = 0
	panel.clip_contents = true
	disableAllNodes(panel, true)
	panel.position = get_global_mouse_position() - panel.size/2
	self.position = panel.position
	self.size = panel.size
	
	
func captureReality():
	if (screenshotPanel):
		screenshotPanel.queue_free()
		screenshotPanel = null
	var allNodes = [];
	getallnodes(gamestate.masternode, allNodes)
	var selection = Rect2(self.position+Vector2(offset,offset),self.size-Vector2(offset,offset)*2);
	capturedRect = selection
	
	var panel = Panel.new()
	gamestate.snapPool.add_child(panel);
	panel.position = selection.position

	var shape = RectangleShape2D.new()
	shape.size = selection.size
	
	panel.size = selection.size
	for item in allNodes:
		#if (abs(item.rotation) > 0.3):
		#	continue
		if (item.is_in_group("Copyable") and item.visible):
			var globrect = item.get_global_rect()
			print(globrect)
			# be heretic, skip test, every copy copies entier scene!
			# anarchy! Game Jam!
			#if (selection.intersection(globrect) and not item.isClone):
			item.cloneObject(panel, true,get_global_mouse_position() - panel.size/2)
			#elif (item.get_parent()):
			#	if (item.get_parent() is RigidBody2D):
			#		var col : RigidBody2D = item.get_parent()
			#		var space_state = get_world_2d().direct_space_state
			#		var params =  PhysicsShapeQueryParameters2D.new()
			#		params.shape = shape
			#		var t = Transform2D()
			#		t.origin = selection.position
			#		params.transform= t
			#		var out = space_state.intersect_shape(params)
			#		for x in out:
			#			if (x.collider == col):
			#				item.cloneObject(panel, true,get_global_mouse_position() - panel.size/2)
			#				
	screenshotPanel = panel
	panel.modulate.a = 1
	panel.self_modulate.a = 0
	#panel.clip_contents = true
	disableAllNodes(panel, false)
	panel.position = Vector2(4000,4000)
	
func disableAllNodes(targetNode, valu):
	targetNode.visible = valu
	targetNode.set_process(valu)
	var allNodes = []
	getallnodes(targetNode,allNodes)
	for w in allNodes:
		w.visible = valu
		w.set_process(valu)

func getallnodes(targetNode, resultArray):
	for N in targetNode.get_children():
		if N.get_child_count() > 0:
			resultArray.append(N)
			getallnodes(N,resultArray)
		else:
			resultArray.append(N)
