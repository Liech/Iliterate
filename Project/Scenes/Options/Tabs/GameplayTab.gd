extends CloneableButton


		
func tabname():
	return "Gameplay"
	
func _on_pressed():
	if (GlobalOptions.Localization.CatSignLanguage == GlobalOptions.localization):
		if (not grounded):
			return;
	
	var allNodes = []
	gamestate.currentTab = "Gameplay"
	getallnodes(gamestate.currentScene,allNodes)
	for w in allNodes:
		if (w.is_in_group("AudioOption")):
			w.visible = false
		elif (w.is_in_group("GameplayOption")):
			w.visible = true
		elif (w.is_in_group("MiscOption")):
			w.visible = false
		if (w.get_parent() is RigidBody2D and not w is CollisionShape2D):
			var col : RigidBody2D = w.get_parent()
			var active = col.collision_layer == 1 or col.collision_layer == 4
			col.freeze = not w.visible or not active
			if (active and w.visible):
				col.collision_mask = 1
				col.collision_layer = 1
			elif(not active and w.visible):
				col.collision_mask = 2
				col.collision_layer = 2
			elif(active and not w.visible):
				col.collision_mask = 4
				col.collision_layer = 4
			elif(not active and not w.visible):
				col.collision_mask = 8
				col.collision_layer = 8
				

func getallnodes(targetNode, resultArray):
	for N in targetNode.get_children():
		if N.get_child_count() > 0:
			resultArray.append(N)
			getallnodes(N,resultArray)
		else:
			resultArray.append(N)
