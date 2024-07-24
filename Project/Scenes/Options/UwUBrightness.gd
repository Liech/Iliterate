extends UwUDialog



func choiceMade(choice):
	if (choice == "I don't wonder why"):
		setTextBlock($insult);
		GlobalOptions.brightness -= 20;
		if (GlobalOptions.brightness < 0):
			GlobalOptions.brightness = 0;
		get_parent().value = GlobalOptions.brightness
	elif (choice == "Smile, you are beautiful"):
		GlobalOptions.brightness += 20;
		if (GlobalOptions.brightness > 100):
			GlobalOptions.brightness = 100;
		get_parent().value = GlobalOptions.brightness
		setTextBlock($smile);
	else:
		closeDialog()
