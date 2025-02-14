extends SceneRoot

func _ready():
	startup()

func DoCommand(command):
	
	if (command == "Back"):
		gamestate.fadeTo(gamestate.Scenes.MainMenu);
	elif(command == "Keybindings"):
		$DoorClosed.visible = true
	elif(command == "Close"):
		$DoorClosed.visible = false
	else:
		super.DoCommand(command)
	

func startup():
	var allNodes = []
	getallnodes(gamestate.currentScene,allNodes)
	for w in allNodes:
		if (w.is_in_group("AudioOption")):
			w.visible = false
		elif (w.is_in_group("GameplayOption")):
			w.visible = true
		elif (w.is_in_group("MiscOption")):
			w.visible = false

func getallnodes(targetNode, resultArray):
	for N in targetNode.get_children():
		if N.get_child_count() > 0:
			resultArray.append(N)
			getallnodes(N,resultArray)
		else:
			resultArray.append(N)
