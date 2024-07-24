extends UwUDialog



func choiceMade(choice):
	if (choice == "Maybe reduce the heat?"):
		setTextBlock($bye);
		GlobalOptions.opacity -= 20;
		if (GlobalOptions.opacity < 0):
			GlobalOptions.opacity = 0;
		get_parent().value = GlobalOptions.opacity
	elif (choice == "Try adding more black sand."):
		GlobalOptions.opacity += 20;
		if (GlobalOptions.opacity > 100):
			GlobalOptions.opacity = 100;
		get_parent().value = GlobalOptions.opacity
		setTextBlock($bye);
	elif (choice == "What are you creating?"):
		nextBlock()
	else:
		closeDialog()
