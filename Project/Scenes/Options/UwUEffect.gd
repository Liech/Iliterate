extends UwUDialog



func choiceMade(choice):
	if (choice == "Listen"):
		if (currentBlock == $Intro):
			setTextBlock($Intro2);
		else:
			setTextBlock($Intro);
	else:
		closeDialog()
