extends UwUDialog

var proofActive = false;
var demonActive = false;
var patties = 0;


var jpressed = false
func _process(delta):
	super(delta)
	if (GlobalOptions.isJumpPressed()):
		if (not jpressed):
			jpressed = true
			if(demonActive):
				gamestate.dialog.get_node("Demon").jiggle()
			if (proofActive):
				patties = patties+1;
	else:
		jpressed = false
		

func choiceMade(choice):
	if (choice == "Not interested in black magic"):	
		setTextBlock($Anger)
	elif (choice == "Bye"):
		closeDialog()
	elif (choice == "Let me fix that"):
		closeDialog()
	elif (choice == "Can we summon one?"):
		setTextBlock($Happy);
	elif (choice == "..."):
		var isNone = gamestate.currentScene.choseKey.get_item_text(gamestate.currentScene.choseKey.selected) == "None"
		if (isNone):
			setTextBlock($Unready)
			return
		
		setTextBlock($Ready);
	elif (choice == "Start Summoning"):
		GlobalOptions.gibberishStarting = true
		setTextBlock($Summon)
	elif (choice == "Arcana Magica!"):
		get_parent()._on_pressed()
		setTextBlock($Summoned);	
		var keyname = gamestate.currentScene.choseKey.englishTexts[gamestate.currentScene.choseKey.selected]	
		gamestate.dialog.setCharacterName(keyname + " Key - Extraplanar Button");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.Nothing)
		gamestate.dialog.setBelly("")
		gamestate.dialog.get_node("Demon").visible = true
		GlobalOptions.gibberishStarting = false
		GlobalOptions.setUwU()
		demonActive=true
	elif(choice == "Hi, nice to meet you"):
		setTextBlock($Arrogant)
	elif(choice == "I am!"):
		setTextBlock($Doubt)
		proofActive = true
		patties = 0
	elif (choice == "Do you belive me now?"):
		if (patties <= 3):
			setTextBlock($Doubt)
			$Doubt.text = "No! " + $Doubt.text
		else:
			setTextBlock($Proven)
	elif (choice == "I love you too"):
		setTextBlock($Onwards)
		gamestate.dialog.setCharacterName("Set - Head of the Club");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("Set")
		gamestate.dialog.get_node("Demon").visible = false
	else:	
		closeDialog()
		gamestate.dialog.get_node("Demon").visible = false
