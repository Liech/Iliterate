extends UwUDialog



func choiceMade(choice):
	if (currentBlock == "Intro"):
		if (choice == "Yes"):
			closeDialog();
		else:
			setTextBlock($Anger);
	else:
		closeDialog();
