extends UwUDialog

var lectureGiven = false

func startup():
	if (not get_parent().button_pressed):
		setTextBlock($Absent)
	elif (lectureGiven):
		setTextBlock($ActualHint)
		gamestate.dialog.setCharacterName("Hint - The bestest teacher");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("Hint")		
	pass

func choiceMade(choice):
	if (choice == "Hello Checkbox Hint"):
		gamestate.dialog.setCharacterName("Hint - The bestest teacher");
		gamestate.dialog.setCharacter(gamestate.dialog.Bodies.ButtonChan)
		gamestate.dialog.setBelly("Hint")
		setTextBlock($Greeting)
	elif (choice == "Listen"):
		setTextBlock($Lecture/LectureTime2)
	elif (choice == "continue"):
		if (currentBlock == $Lecture/LectureTime2):
			setTextBlock($Lecture/LectureTime3)
		elif (currentBlock == $Lecture/LectureTime3):
			setTextBlock($Lecture/LectureTime4)
		elif (currentBlock == $Lecture/LectureTime4):
			setTextBlock($Lecture/LectureTime5)
		elif (currentBlock == $Lecture/LectureTime5):
			setTextBlock($Lecture/Question)
	elif (choice == "Yes"):
		setTextBlock($Lecture/Yes)
	elif (choice == "No"):
		setTextBlock($Lecture/No)		
	elif (choice == "Enlightenment"):
		setTextBlock($Lecture/LectureIsOver)		
	elif (choice == "Don't Listen"):
		setTextBlock($MindWanders)	
	elif (choice == "Freedom!"):
		lectureGiven = true
		setTextBlock($CanITalkToYou)	
	elif (choice == "Sure"):
		setTextBlock($ActualHint)	
	elif (choice == "ahhhHHHhhHH"):
		GlobalOptions.localization = GlobalOptions.Localization.Gibberish;
		setTextBlock($Chaos)
		lectureGiven = true
	elif (choice == "s s s s s s s s s"):
		GlobalOptions.localization = GlobalOptions.Localization.UwU
		setTextBlock($CanITalkToYou)				
	else:
		closeDialog();
