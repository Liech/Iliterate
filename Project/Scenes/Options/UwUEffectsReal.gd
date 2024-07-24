extends UwUDialog



func choiceMade(choice):
	if (choice == "Lower your drums a bit."):
		setTextBlock($bye);
		GlobalOptions.effectAudio -= 5;
		if (GlobalOptions.effectAudio < 0):
			GlobalOptions.effectAudio = 0;
	elif (choice == "Mount your drums higher."):
		GlobalOptions.effectAudio += 5;
		if (GlobalOptions.effectAudio > 100):
			GlobalOptions.effectAudio = 100;
		setTextBlock($bye);
	elif (choice == "Yeah!"):
		nextBlock()
	else:
		closeDialog()
